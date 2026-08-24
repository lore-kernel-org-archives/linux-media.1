Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEE333BBCF
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787565751; cv=none; b=k784Ym8KhE4CExL4L9AYUeFX2y8Cj8mOywrbd6jHChdzcVEPhnDUhpRRvrEn0AZx6zh8uyfIQrzbVL+68ljyplfbwJ0VdxgaOHmCBKHY3jkjGBI2rhE1zDHMYyr6MEyb4CtwgQBye3QzIejhVkln5Prqk5rwEkT6ibZ0t7e/zg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787565751; c=relaxed/simple;
	bh=SGJj42RIttGaf7HST7uxZF8NuWfgPrDnOwcXTEye7Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a176BtKT1ag+CsnpBiWMrKpzAoMRMfuDpc2cEdu8pzpLpZaMc1QbVw3NU+rC+ALpHQhq36EzoQ9o4bjuGvsQE/78p7so+Fp7DnAJZJYc0aJqGEcGFXbQ5dwSjzvdTGwPYjdUI3NqKVB5Zyl+APDOuJX1rgoDuQcV1ASCXF6V6L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmQWUK3k; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmQWUK3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787565749; x=1819101749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SGJj42RIttGaf7HST7uxZF8NuWfgPrDnOwcXTEye7Ek=;
  b=BmQWUK3k9E+1cg8XowIR/UAqLCnETBE32ORn3ty4k0jV4WfzlUChxRv8
   eEHqun+T/ShY7aVDU8tWy4WMdFoLXGj514Py8Wv6su4rtQYPaNdSymODd
   P/P2k++LaaQ5O3ZfAc3xeXDHZzZ+yXURn+ArcmLtUMpeycC9SM1EijUs7
   DZXb4j5xdud1CC1fW9peVXY2dxcGtHo5Hnuh9faR50Uc0mWMdctWNA7GO
   CnAvFkaXXseTSLzzSrPo8ckGNa7qbCj9Bz8/ccNI1j9fXaG3LoCqUS55P
   PUKEcj6Ogimwdd+mEvrOQj9MVEtYcwvhxYj9Vd+l+1kN4wvefRguMInEi
   Q==;
X-CSE-ConnectionGUID: G4wF8p47SqGExs9BuU5IZA==
X-CSE-MsgGUID: VBB3q3AWSieIccsqmXn+0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="87883374"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="87883374"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 03:02:28 -0700
X-CSE-ConnectionGUID: N4YoV+lmQEWpuzaMQmQnpg==
X-CSE-MsgGUID: 1XlDNno5R+2lAgnoE/BabQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267529356"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.180])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 03:02:27 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E7A1E11F82E;
	Mon, 24 Aug 2026 13:02:37 +0300 (EEST)
Date: Mon, 24 Aug 2026 13:02:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Durgesh Ajgaonkar <drajgaonkar@gmail.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [REGRESSION?] Intel IPU6/OV2740 camera fails to stream after
 camera use on ThinkPad X1 Carbon Gen 10
Message-ID: <aowWveS-itiL_Cyv@kekkonen.localdomain>
References: <CAFt93pqcefoiURczzaVTH_QxSZtmkyh3B3Z3CD0QemSsyRHopQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFt93pqcefoiURczzaVTH_QxSZtmkyh3B3Z3CD0QemSsyRHopQ@mail.gmail.com>

Hi Durgesh,

Thank you for the e-mail.

On Sun, Aug 23, 2026 at 06:26:45PM -0400, Durgesh Ajgaonkar wrote:
> Hello,
> 
> I am reporting two problems with the built-in OV2740 camera on a ThinkPad
> X1 Carbon Gen 10 with Intel IPU6:
> 
> 1. When the camera is functioning, 1280x720 video is limited to
> approximately 10-11 FPS.

Do you use libcamera (e.g. qcam) or the downstream psys driver / Intel
Camera HAL in this case?

I just tested Yoga G7 here and it works fine, albeit with a fairly high CPU
load, with qcam.

> 
> 2. After certain camera-use sequences, the camera can subsequently fail to
> produce frames. In the failing state, the IPU6 ISYS/CSI2 driver reports CRC
> errors, packet-header errors, FIFO overflow, frame synchronization errors,
> and eventually a stream stop timeout.
> 
> The camera can work normally from a clean state, but after using the camera
> through another camera application, qcam can subsequently fail to produce
> frames. In the failing state, the kernel reports errors from the IPU6 ISYS
> CSI2 receiver, including CRC errors, packet header errors, FIFO overflow,
> frame synchronization errors, and eventually a stream stop timeout.
> 
> Hardware/software information:
> 
> - Laptop: Lenovo ThinkPad X1 Carbon Gen 10
> - Camera sensor: OV2740
> - Camera interface: Intel IPU6
> - IPU6 PCI device: 0000:00:05.0
> - Sensor ACPI/I2C identifier: INT3474:01
> - Sensor I2C address: 0x36
> - Normal kernel: 7.1.8-1-cachyos
> - libcamera: 0.7.0+ov01a10.2
> - qcam: libcamera qcam
> - Distribution: CachyOS
> 
> The kernel detects the IPU6 and sensor correctly:
> 
>     intel-ipu6 0000:00:05.0: Found supported sensor INT3474:01
>     intel-ipu6 0000:00:05.0: Connected 1 cameras
>     intel-ipu6 0000:00:05.0: IPU6-v3[465d] hardware version 5
> 
> The media topology shows the OV2740 connected to IPU6 CSI2 port 1,
> which is connected to ISYS Capture 8 (/dev/video8):
> 
>     ov2740 17-0036
>         -> Intel IPU6 CSI2 1
>         -> Intel IPU6 ISYS Capture 8 (/dev/video8)
> 
> The sensor/CSI2 topology reports:
> 
>     ov2740 17-0036:
>         SGRBG10_1X10/1932x1092
> 
>     Intel IPU6 CSI2 1:
>         SGRBG10_1X10/1932x1092
> 
>     /dev/video8:
>         1932x1092 BG10
> 
> The relevant v4l2-ctl output for /dev/video8 shows:
> 
>     Driver name      : isys
>     Card type        : ipu6
>     Bus info         : PCI:0000:00:05.0
>     Driver version   : 6.18.42
>     Video Capture
>     Metadata Capture
>     I/O MC
>     Streaming
> 
>     Format Video Capture:
>         Width/Height      : 1932/1092
>         Pixel Format      : 'BG10'
>         Field             : None
>         Bytes per Line    : 3904
>         Size Image        : 4267072
> 
> A direct v4l2-ctl streaming attempt on /dev/video8 also fails in the
> problematic state:
> 
>     v4l2-ctl -d /dev/video8 \
>         --set-fmt-video=width=1932,height=1092,pixelformat=BG10 \
>         --stream-mmap \
>         --stream-count=10
> 
> returns:
> 
>     VIDIOC_STREAMON returned -1 (Broken pipe)
> 
> and produces a zero-byte output file.

This won't work because the MC pipeline hasn't been configured yet.

> 
> This indicates that the problem is not limited to qcam's UI or camera
> application. The failure also occurs when attempting to stream directly
> through the V4L2 ISYS capture device.
> 
> In contrast, qcam can successfully open and stream the camera on the same
> CachyOS kernel from a working state.
> 
> A successful qcam run produced:
> 
>     Found 5 IPU6 camera(s) via libcamhal
>     Found IPU6 camera 0: ov2740-uf (facing=0)
>     Adding camera 'ipu6-ov2740-uf-0'
>     Opening camera device 0
>     Camera device 0 opened successfully
>     Configured HAL stream: 1280x720 NV12
>     Streaming started for camera 0
>     Streaming stopped for camera 0

Qcam works as libcamera does set up the pipeline.

> 
> The complete successful qcam output is attached as:
> 
>     qcam-cachyos-success.txt
> 
> The important difference is the kernel output observed during the failing
> state. The IPU6 ISYS reports:
> 
>     intel_ipu6_isys.isys intel_ipu6.isys.40:
>         csi2-1 error: Payload checksum (CRC) error
> 
>     csi2-1 error: Single packet header error corrected
>     csi2-1 error: Multiple packet header errors detected
>     csi2-1 error: Payload checksum (CRC) error
>     csi2-1 error: Transfer FIFO overflow
>     csi2-1 error: Incomplete long packet detected
>     csi2-1 error: Frame sync error
>     csi2-1 error: Inter-frame long packet discarded
> 
> Later the driver reports:
> 
>     stream stop time out
>     stream close error: 3
> 
> The complete dmesg from the failing state is attached as:
> 
>     dmesg-cachyos-qcam-failure.txt
> 
> I have also observed that qcam can work when it is the first camera
> application started, while subsequent attempts can fail after the camera
> has been used by another camera application. I have not established
> whether this ordering is required to reproduce the problem in every case,
> so I am reporting it as an observed condition rather than a definitive
> cause.
> 
> The failure appears to leave the IPU6 CSI2/ISYS path in a state where the
> sensor is detected and the media topology remains present, but streaming
> cannot successfully start or complete.
> 
> For comparison, the sensor is correctly detected and the media links are
> present in the failing state. The relevant topology is:



> 
>     ov2740 17-0036
>         -> Intel IPU6 CSI2 1 [ENABLED, IMMUTABLE]
>         -> Intel IPU6 ISYS Capture 8 (/dev/video8) [ENABLED]
> 
> I would appreciate advice on which component is responsible for this
> failure and whether this points to an IPU6 ISYS/CSI2 driver issue, an
> OV2740 sensor driver issue, or an interaction with the IPU6 userspace
> HAL/libcamera implementation.
> 
> I can provide the complete media-ctl topology, v4l2-ctl output, additional
> kernel logs, and reproduction details if needed.
> 
> Thank you.
> [0:13:28.593759853] [6662]  INFO Camera camera_manager.cpp:340 libcamera v0.7.0+ov01a10.2
> [08-23 18:13:38.195] CamHAL[INF] aiqb file name OV2740_CJFLE23_ADL.aiqb
> [08-23 18:13:38.196] CamHAL[INF] aiqb file name OV2740_CJFLE23_ADL.aiqb
> [08-23 18:13:38.197] CamHAL[INF] aiqb file name AR0234_TGL_10bits.aiqb
> [08-23 18:13:38.197] CamHAL[INF] aiqb file name AR0234_TGL_10bits.aiqb
> [08-23 18:13:38.197] CamHAL[INF] aiqb file name AR0234_TGL_10bits.aiqb
> [08-23 18:13:38.197] CamHAL[INF] aiqb file name AR0234_TGL_10bits.aiqb
> [08-23 18:13:38.197] CamHAL[INF] aiqb file name AR0234_TGL_10bits.aiqb
> [08-23 18:13:38.197] CamHAL[INF] aiqb file name AR0234_TGL_10bits.aiqb
> [08-23 18:13:38.198] CamHAL[INF] aiqb file name AR0234_TGL_10bits.aiqb
> [08-23 18:13:38.198] CamHAL[INF] aiqb file name AR0234_TGL_10bits.aiqb
> [0:13:28.780464326] [6667]  INFO IPU6 ipu6.cpp:714 Found 5 IPU6 camera(s) via libcamhal
> [0:13:28.780493938] [6667]  INFO IPU6 ipu6.cpp:175 Found IPU6 camera 0: ov2740-uf (facing=0)
> [0:13:28.780512190] [6667]  INFO Camera camera_manager.cpp:223 Adding camera 'ipu6-ov2740-uf-0' for pipeline handler ipu6
> [0:13:28.812790617] [6662]  INFO Camera camera.cpp:1216 configuring streams: (0) 1280x720-NV12/sYCC
> [0:13:28.812904980] [6667]  INFO IPU6 ipu6.cpp:232 Opening camera device 0
> [0:13:28.818307627] [6667]  INFO IPU6 ipu6.cpp:240 Camera device 0 opened successfully
> [0:13:28.870234989] [6667]  INFO IPU6 ipu6.cpp:276 Configured HAL stream: 1280x720 NV12, stream_id=0 size=1382400
> Using software format conversion from NV12
> [0:13:29.367371564] [6667]  INFO IPU6 ipu6.cpp:327 Streaming started for camera 0
> [0:14:12.224443123] [6667]  INFO IPU6 ipu6.cpp:374 Streaming stopped for camera 0
> [08-23 18:14:21.700] CamHAL[WAR] Failed to open file /run/camera/ov2740-uf_VIDEO.aiqd, error No such file or directory

Intel camera HAL issues should be filed to the intel/ipu6-camera-hal Github
project.

> [    0.709157] SCSI subsystem initialized
> [    0.855334] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
> [    4.940121] intel-ipu6 0000:00:05.0: enabling device (0000 -> 0002)
> [    4.961892] intel-ipu6 0000:00:05.0: Found supported sensor INT3474:01
> [    4.962116] intel-ipu6 0000:00:05.0: Connected 1 cameras
> [    4.962909] intel-ipu6 0000:00:05.0: Sending BOOT_LOAD to CSE
> [    4.980282] intel-ipu6 0000:00:05.0: Sending AUTHENTICATE_RUN to CSE
> [    5.049740] intel-ipu6 0000:00:05.0: CSE authenticate_run done
> [    5.049746] intel-ipu6 0000:00:05.0: IPU6-v3[465d] hardware version 5
> [    5.084116] intel_ipu6_psys: loading out-of-tree module taints kernel.
> [    5.084122] intel_ipu6_psys: module verification failed: signature and/or required key missing - tainting kernel
> [    5.099043] intel_ipu6_psys.psys intel_ipu6.psys.40: pkg_dir entry count:8
> [    5.099420] intel_ipu6_psys.psys intel_ipu6.psys.40: psys probe minor: 0
> [    7.894742] ov2740 i2c-INT3474:01: supply AVDD not found, using dummy regulator
> [    7.894849] ov2740 i2c-INT3474:01: supply DOVDD not found, using dummy regulator
> [    7.894865] ov2740 i2c-INT3474:01: supply DVDD not found, using dummy regulator
> [  495.209979] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-1 error: Payload checksum (CRC) error
> [  495.631202] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-1 error: Single packet header error corrected
> [  495.631217] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-1 error: Multiple packet header errors detected
> [  495.631221] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-1 error: Payload checksum (CRC) error
> [  495.631225] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-1 error: Transfer FIFO overflow
> [  495.631228] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-1 error: Incomplete long packet detected
> [  495.631231] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-1 error: Frame sync error
> [  495.631234] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-1 error: Inter-frame long packet discarded
> [  495.664758] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-1 error: Multiple packet header errors detected
> [  495.664777] intel_ipu6_isys.isys intel_ipu6.isys.40: csi2-1 error: Payload checksum (CRC) error
> [  550.389252] intel_ipu6_isys.isys intel_ipu6.isys.40: stream stop time out
> [  550.484045] intel_ipu6_isys.isys intel_ipu6.isys.40: stream close error: 3

-- 
Regards,

Sakari Ailus
