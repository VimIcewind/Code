/**
 * 作者：郭无心
 * 链接：https://www.zhihu.com/question/36688387/answer/68667704
 * 来源：知乎
 * 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.rmi.registry.LocateRegistry;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.management.MBeanServer;
import javax.management.MBeanServerFactory;
import javax.management.ObjectName;
import javax.management.remote.JMXConnectorServerFactory;
import javax.management.remote.JMXServiceURL;

import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;

import com.sun.jdmk.comm.HtmlAdaptorServer;

/**
*
*
*
*/
public class ApplicationServer
{
	private static HtmlAdaptorServer adaptorServer = null;
	private static javax.management.remote.JMXConnectorServer cs = null;
	private static Logger logger = null;
	private static ExecutorService cachedExecutors = null;

	private static void initExecutor()
	{
		cachedExecutors = Executors.newFixedThreadPool(2);

	}

	private static void exitExecutor()
	{
		cachedExecutors.shutdown();
	}

	public static void execute(final Runnable runnable)
	{
		cachedExecutors.execute(runnable);
	}

	private static void initLogger()
	{
		System.out.println("configuring log4j with log4j.xml");
		DOMConfigurator.configure("log4j.xml");
		logger = Logger.getLogger("root");
	}

	private static void initHtmlJMX() throws Exception
	{
		MBeanServer server = MBeanServerFactory.createMBeanServer();

		ObjectName helloName = new ObjectName("jmx:name=HelloWorld");
		server.registerMBean(new Hello(), helloName);

		ObjectName adapterName = new ObjectName("HelloAgent:name=htmladapter,port=8081");
		adaptorServer = new HtmlAdaptorServer();
		server.registerMBean(adaptorServer, adapterName);

		adaptorServer.start();

		logger.info("start jmx html server");
	}

	private static int initProtogenesisJMX() throws Exception
	{
		String port1Str = System.getProperty("com.jmxport1");
		String port2Str = System.getProperty("com.jmxport2");
		if (port1Str == null || port2Str == null)
		{
			logger.error("jmx端口未通过系统属性设置");
			return -1;
		}
		final int port1 = Integer.valueOf(port1Str);
		final int port2 = Integer.valueOf(port2Str);
		System.setProperty("java.rmi.server.randomIDs", "true");
		try
		{
			LocateRegistry.createRegistry(port2);
		}
		catch (java.rmi.server.ExportException ex)
		{
			logger.error("err", ex);
			return -1;
		}
		MBeanServer mbs = ManagementFactory.getPlatformMBeanServer();
		java.util.HashMap<String, Object> env = new java.util.HashMap<String, Object>();
		env.put("jmx.remote.x.password.file", "jmxremote.password");
		env.put("jmx.remote.x.access.file", "jmxremote.access");

		JMXServiceURL url = new JMXServiceURL("service:jmx:rmi://127.0.0.1:" + port1 + "/jndi/rmi://127.0.0.1:" + port2
				+ "/jmxrmi");
		cs = JMXConnectorServerFactory.newJMXConnectorServer(url, env, mbs);

		try
		{
			cs.start();
		}
		catch (java.net.BindException ex)
		{
			logger.error("端口已被占用", ex);
			return -2;
		}

		return 0;
	}

	public static void exitHtmlJMX()
	{
		adaptorServer.stop();
	}

	public static void exitProtogenesisJMX() throws IOException
	{
		cs.stop();
	}

	public static void init() throws Exception
	{
		initLogger();

		// initHtmlJMX();
		initProtogenesisJMX();

		initExecutor();

	}

	public static void exit() throws IOException
	{
		//exitHtmlJMX();
		exitProtogenesisJMX();

		exitExecutor();
	}

	public static void main(String[] args) throws Exception
	{
		System.setProperty("com.jmxport1", String.valueOf(7000));
		System.setProperty("com.jmxport2", String.valueOf(7001));

		init();

		MBeanServer server = java.lang.management.ManagementFactory.getPlatformMBeanServer();

		ObjectName helloName = new ObjectName("jmxBean:name=stopper");

		server.registerMBean(new Stopper(), helloName);
	}

	public interface StopperMBean
	{
		void stop() throws IOException;
	}

	public static class Stopper implements StopperMBean
	{
		public void stop() throws IOException
		{
			ApplicationServer.exit();
		}
	}

}
