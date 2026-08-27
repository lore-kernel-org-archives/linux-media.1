Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877C3AFCE1
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 23:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873202; cv=none; b=nt55nqquYMXy8pF1BF0LCIHe/+QAm5Jyh1Nxb417ovz09Bu5twnM3tiC5dar6+5xwZOE5TDil6i9o6AWrMUNP2kLyncIHzOb/R5mKBpUte7fYCDpCXtCZW+EB+c9aBv+UUTS0ygVu16flDvvGmaQk3j7L7/Z/WPcpKHj/wmN6W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873202; c=relaxed/simple;
	bh=UA3HgTL2/3fiKoMvjcd1YQpPArg7+zF0NnGj2ZlC1vM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FeQgfmNngeT8fvndOCerNfZLPjD5Su4/f8EEEQbBfdiIp3+qOzicr9YGLV+PBi7Ea4VxNxzp76GDe8O0j2eWUr371BRsFIucBOD89KaB+2AUwTR7yFpmr2GgvGoz66nh0dJpGGycEX4hU79Te9FgPtTjyzA1cZaVIaj7FB4vJzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1+568o5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1+568o5"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso2107415e9.2
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 16:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787873198; x=1788477998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h567K50/oXSByLqwixw9RWT+27INaS5M3SHo3Ovf/9c=;
        b=k1+568o5AEWwWBVhfyfsmLwuCjZDArWj0e59LLIHxc2Lt6txfZb0JaIzOYJvrZXGT9
         jRnx0C8ZuqDyxabEDGtJkWRomkpX5yciRwgLn+2rVQvTfs9DCrLxwLAafZzeLtXSgTR8
         sCsh1LJNuuv1Hg7Okv9hbd0WgZLrAsyA2xhP9D2LDley8Lc75vl1yaUj5rfYRFhTc1GH
         9rUlUeEilXogXTdXgsquTbm2PQiHLN5eWMX+9M9nEt3qSnwLUbRWK78ZDPLPu2CqF/+Y
         a6Tnj2pmQETbmDhA/5e6pBJXGxfHuevtnjkWePfN2xUG6IeAH9MUP1sxlAV4kB74h0u8
         zeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873198; x=1788477998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h567K50/oXSByLqwixw9RWT+27INaS5M3SHo3Ovf/9c=;
        b=n+aNmInGZWj5L8QQObnn69WGYICYLTcz9it4vWhU7Mf56bAFsRB2PwQPIuEXY1vMPf
         RxYAcmvfoKok0KY9er7AX3efV9Wry+0TFiLGklT2flC60TEYjbwd53xgdusQWdPGrv5A
         ZpwIXhkL5FNOB6BQ+hNmYbilm3KcBskln32MkhLimxBt7SvGHbL7d9RpuxcqbNdLyPvn
         f28STz+yv+S7fUS7VyRoXZdjorqqkL8h2ZZhv5ziOX4LQsT55E3BPg/fDCmOQX9JXxOS
         b8skZpNvG4K/qeC8dSWvM+fs1fFDNu1OP5gR6vC62GgHT++a+WqgUCfdXhiEXCU6H+MI
         4f7A==
X-Forwarded-Encrypted: i=1; AHgh+Rrj3mU5GKJHzUnzgivxwSgqdKkjd+JMmTs7qYEVSaeEduS0oN8uNspPXRqWw5H7Dglf9MGN5s9uAdOV2Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nu1bRn5FP7NZcPDARGUXJAtWD589mxzHfKph7goQryX/22CMng
	0yiyrGfUkOtmuz4SfHjQuUl2nY/FVouJAPfUeq6MmjKwjrLg/gQ0FbM=
X-Gm-Gg: AR+sD10+1d7KmV8/Zvo0lbXO/d20jNgZIOCOEjwexFFOIhBmrb5aE2SYcF1si16OvB/
	M4Qkr+5oSFJYre/NjnTqdt9LxBEX4TOyhhB6O0+PlEAq838VJwRDGboYh4wWThbCkyRWyyjlFdD
	GSrwTSOQ2IvzsOH+kTVgEcgtKZ68x5Xi5CcAmeCKQ3bRnh2Fw2B/pO/BOMqzMf9bcVaqJLxlgNj
	T75WjtrqTxoGIld9rs3IfOagBRHAOhhwelOaEWH5dSU0tQudsYyWjYOQaaVhBcJSGh2P/nbwYtH
	+H/4dPcAeJsyEwjdIeTFmii8N+R6gKdQXa5jVoazNOwcNJwpcSR1UhHZDjIbYe3inVfelYBGqE7
	Taxwcy9ryQtLlwNw99aSEBTJrlsxCRvBI/lZnxlMgljkjlRp5Ab4+uQ2DXtsoFqpZUK46Ww6itU
	wdQEGzVQ1bo7EZQuRSDv3YRaxwrSOn9MSNK+HprYb4193DjGLvyC2QuXgXRtuwzmM87h5i4kOey
	RCcK6De8716RA==
X-Received: by 2002:a05:600c:1f8f:b0:499:b65d:1250 with SMTP id 5b1f17b1804b1-49b91c1fc4bmr20835875e9.2.1787873198171;
        Thu, 27 Aug 2026 16:26:38 -0700 (PDT)
Received: from surface.. ([217.61.227.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbe1dsm12869238f8f.22.2026.08.27.16.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:26:37 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>
Cc: "D . Manresa" <dmanresa@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: ipu-bridge: software nodes are never unregistered; PCI remove/rescan of IPU6 fails with -EEXIST and leaves dangling properties
Date: Fri, 28 Aug 2026 01:26:36 +0200
Message-ID: <20260827232636.93145-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

ipu-bridge registers software nodes at probe time but has no teardown
path at all: nothing unregisters them when the IPU device goes away.
After a PCI remove/rescan of the IPU6, re-probe fails with -EEXIST,
the orphaned nodes stay in /sys/kernel/software_nodes/, and once the
module has been unloaded their properties reference freed module
memory, so sensor drivers that re-probe read garbage. There is no
userspace interface to remove software nodes; only a reboot recovers.

Hardware / kernel
-----------------
- Microsoft Surface Pro 7+, IPU6 Tiger Lake (PCI 8086:9a19, 0000:00:05.0)
- sensors OV5693 (INT33BE), OV8865 (INT347A, dw9719 VCM), OV7251
  (INT347E)
- linux-surface 6.19.8-surface-3 (base v6.19.8). The linux-surface
  patchset only adds entries to ipu_supported_sensors[]; the
  registration/teardown paths discussed here are unmodified mainline.
  Line references are against mainline v6.19.

Analysis
--------
ipu_bridge_init() (drivers/media/pci/intel/ipu-bridge.c:837), called
from ipu6_isys_init() (drivers/media/pci/intel/ipu6/ipu6.c:378) during
probe:

- kzallocs struct ipu_bridge (ipu-bridge.c:854); on success it is
  intentionally never freed -- the comment at ipu-bridge.c:870 keeps
  data in the struct "so that it survives if the module is unloaded
  along with the rest of the struct";
- registers the IPU HID node "INT343E" (IPU_HID,
  include/media/ipu-bridge.h:11) via software_node_register()
  (ipu-bridge.c:864);
- registers one node group per sensor via
  software_node_register_node_group() in ipu_bridge_connect_sensor()
  (ipu-bridge.c:729);
- points the sensor ACPI fwnode at the swnodes: primary->secondary =
  fwnode (ipu-bridge.c:743), and set_secondary_fwnode(dev, fwnode) for
  the IPU itself (ipu-bridge.c:893).

The only unregister calls in the file are error paths inside init
itself: ipu_bridge_unregister_sensors() (static, ipu-bridge.c:681,
called at 784 and 898) and software_node_unregister(
&bridge->ipu_hid_node) (ipu-bridge.c:900). No teardown function is
exported, and nothing on the ipu6 remove path unregisters the nodes or
clears the secondary fwnodes.

Because the swnodes and their property_entry arrays live in the leaked
heap struct they survive unbind, but they are not self-contained:

- the property name strings are pointers into the module image
  (sensor->prop_names = prop_names at ipu-bridge.c:367; static const
  prop_names at ipu-bridge.c:124);
- the "link-frequencies" values point at cfg->link_freqs inside the
  module-rodata table ipu_supported_sensors[] (property built at
  ipu-bridge.c:433, table at ipu-bridge.c:51).

So after ipu_bridge.ko is unloaded, the still-registered nodes carry
dangling pointers, and the sensors' ACPI fwnodes still have
fwnode->secondary aimed at them.

Observed behaviour (live, 2026-08-27)
-------------------------------------
Attempting to recover a wedged ISYS by PCI remove/rescan:

  echo 1 > /sys/bus/pci/devices/0000:00:05.0/remove
  modprobe -r intel_ipu6_isys intel_ipu6    # ipu_bridge unloads too
  echo 1 > /sys/bus/pci/rescan
  modprobe intel_ipu6

dmesg (verbatim, trimmed):

  sysfs: cannot create duplicate filename
   '/kernel/software_nodes/INT343E'
  Call Trace:
   sysfs_warn_dup+0x8b/0xb0
   ...
   swnode_register+0x165/0x240
   software_node_register+0xd2/0x120
   ipu_bridge_init+0x192/0xeb0 [ipu_bridge]
   ipu6_pci_probe+0x417/0xbe0 [intel_ipu6]
   ...
  kobject: kobject_add_internal failed for INT343E with -EEXIST, don't
   try to register things with the same name in the same directory.
  intel-ipu6 0000:00:05.0: Failed to register the IPU HID node
  intel-ipu6 0000:00:05.0: error -EEXIST: IPU6 bridge init failed
  intel-ipu6 0000:00:05.0: probe with driver intel-ipu6 failed with
   error -17

The sensor drivers, re-probing against the stale secondary fwnodes,
then read poisoned link-frequencies (verbatim):

  ov5693 i2c-INT33BE:00: supported link freq 419200000ll not found
  ov5693 i2c-INT33BE:00: probe with driver ov5693 failed with error -22
  ov7251 i2c-INT347E:00: error -EINVAL: no supported link freq found
  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -22
  ov8865 i2c-INT347A:00: failed to find 360000000 clk rate in endpoint
   link-frequencies

(The ov5693/ov7251 on this machine carry local patches, so the exact
wording of their two lines may differ from pure mainline; the ov8865
line is the unmodified mainline driver, and the values being missed --
419200000, 360000000 -- are exactly what the bridge publishes for
these sensors at ipu-bridge.c:61 and :69, so the properties no longer
return their original contents.)

/sys/kernel/software_nodes/ afterwards still lists INT343E, INT33BE-4,
INT347A-1, INT347E-5 and dw9719-1. There is no userspace interface to
unregister a software node, so the system cannot be recovered without
a reboot.

Reproducer
----------
On any IPU6 machine handled by ipu-bridge:

  1. boot normally, wait for "Connected N cameras"
  2. echo 1 > /sys/bus/pci/devices/0000:00:05.0/remove
  3. modprobe -r intel_ipu6_isys intel_ipu6
  4. echo 1 > /sys/bus/pci/rescan
  5. modprobe intel_ipu6

Step 5 (or the automatic probe at step 4) fails with the -EEXIST trace
above and the cameras are gone until reboot.

Expected: either an idempotent/refcounted ipu_bridge_init() that
reuses already-registered nodes across rebinds, or a real teardown
that unregisters the node groups and clears the secondary fwnodes on
unbind (at which point the deliberate struct leak could go as well).

Workaround: none other than not touching the PCI device; documented as
an operational trap in
https://github.com/dmanresa-saes/surface-ipu6-cameras

Happy to test patches on this hardware.

This report was drafted with AI assistance (Anthropic Claude) and
verified on the actual hardware by the undersigned.

D. Manresa <dmanresa@gmail.com>
