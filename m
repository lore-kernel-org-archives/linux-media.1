Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893249;
	b=iBrL1VDzECjG5UVMPo1Ve9Tr2qLMByYcPb2uEDiemiBxH/VmWKB4BURAB9nXJMQX/0ZL
	 Z1Bi9eAWog5FmrtanS+21ICLGuItR+dDmKeuEfXiaBXZ4CbfhNUtqHwAL5tPu1coI40Ag
	 /FH/ca6CKLS/eVu128PpCrW36CB5iWU2QQIg67Bv4a4qngkUJ6RtQxgqfC3uPVJNRvhpr
	 YoOhjh6AulhnXFZhkSe8JqdI0bNvIZmwMXBU9nz22upwON5TOHvKhM4jl6eN60OLhYdYu
	 pLzrNioyGAyd7e/CjGxmH6JxNAdLn6R1QgE9KpnmwYLhLFpn49+kXxvBMk7mxugTcEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893249;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:To:Cc:Subject:Content-Language:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=40pMQfzZapox/TR+h3n4wPD9m1UY5OoE3nwwXJGsLP4=;
	b=3DGxpWscYnFG+hyQzFQZdVWALPSWLXjCMadiqKJdmVGe7kKkP0n9Tw3cMX7n6AehbILX
	 C/PxgckyzKL9kF222XZyFnJUap3xY258MQU7vyb4Cm1cSnYxvHGvsuMJO9QzuTWcBWPdH
	 QmYqLmtgN2GRGHddEPgFd7gtb9xP2R5TocTXJ2csewXqNFbE0W2W2chwi1vn0j8lCDMnr
	 1huh6n3P3/clJDtiJAWIOPx2f76dgb1gM/oWPrl/Fja0Rz1fo4Qcc5Dg55fHZJ1w3Inpj
	 Bs4cuaHjyhP/tlo+UaIumCGJYsReCcS6PWj5oNfb9cll/v+egJJTRI5lg7DFvDcVdVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=guido.kraemer@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=IPOiVWWF;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44F6606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 15:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=guido.kraemer@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=IPOiVWWF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793893240; x=1794498040; i=guido.kraemer@gmx.de;
	bh=40pMQfzZapox/TR+h3n4wPD9m1UY5OoE3nwwXJGsLP4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:To:Cc:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IPOiVWWFEXo7kEvWBqpKLISDGCD1tv3r+wH2I6UMOkWgld6o96Kczp4eXtUZA64o
	 YEqAO0kTq5vf+58sts5fVcHWsWlbQUUCG/M5AfGP3K4FKjUe8U7GZmvDrYjU/ziBt
	 Nx+zpi91s+1nUL/NPzcpNy66W+DomA+FYCMlh7DgEV3Guzs797qDdi1fv6sSh28th
	 Io8+LZEukz1rpMvJUcrzktR6U9tb0QEdlpcr2HqrQ5/8r7tpNG9GSDZcyDo9rNwRR
	 6hawj2CKZm3E14T+VJ5CeM23zVfIm21+pDIugMtlwB4Tqr46QRM0mk9MF6yQDzYxK
	 bCLdbaSAg6Dml4hlFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9o21-1xSaTd1H7d-002rPj; Thu, 05
 Nov 2026 16:40:40 +0100
Message-ID: <3e8ae2ad-c804-45c3-8c52-ab25481cb430@gmx.de>
Date: Thu, 5 Nov 2026 16:40:39 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Guido Kraemer <guido.kraemer@gmx.de>
To: Bin Du <bin.du@amd.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: linux-media@vger.kernel.org, Caspar Adriani <caspar.adriani@proton.me>,
 Seifelden Abdelmonem <saif.elden.hatim@gmail.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
Subject: AMD ISP4: SET_STREAM_CONFIG fails, no frames on HP ZBook Ultra G1a
Content-Language: de-DE, en-US-large, es-ES
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:GBchyBv+khDfhxc7hOM5ifncxV7oZzKFhXhXc8OPhUY7ekWph1n
 2JHDPTa+4g3ZUMJoLtNvZHKNDOFAzMppGLzNM4XAibqoA1ybG4I2fqNduAAZ83I6KrLdmat
 DF6bGtazMDsf7jmNLLgEZ6qz29NlQloIyQq3AepqjNche1Aq1AqIQ4SxklpBBelRd0oingd
 P7I8AQsEcOEkRQLCu+Wiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nAuuT5ytLsw=;pr8Z7EctMONcsX4rKSt5hJh6jkN
 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
 ipIzhJ

Hi Bin, hi Pratap,

the built-in camera of my HP ZBook Ultra G1a stopped delivering frames.
The ISP firmware boots on every stream start, but answers
SET_STREAM_CONFIG with ISP4FW_CMD_STATUS_FAIL, and no FRAME_DONE
notification ever arrives. Applications show a black image.

Setup:

   - HP ZBook Ultra G1a 14 inch Mobile Workstation PC
   - BIOS X89 Ver. 01.06.02 (08/26/2026), updated from 01.05.07 with
     fwupd on 2026-10-25
   - Linux 7.3.1 plus Caspar's "fix self-deadlock in
     isp4sd_start_stream() error path" and Seifelden's two isp4 fixes
   - linux-firmware-amdgpu 20260916 (isp_4_1_1.bin)

Debug log of one stream start (dynamic debug on amd_isp4_capture,
Zoom requesting 1280x720 YUYV):

   15:44:28.769780 enable isp_subdev module
   15:44:28.781101 ISP CCPU FW boot success
   15:44:28.781285 send fw mem pool 0x7fff041d8000(104857600) suc
   15:44:28.781327 isp4fw_sensor_id 0, pipeId 0x5f91 EnableTnr 1
   15:44:28.781415 channel:prev,fmt YUV422INTERLEAVED,w:h=1280:720,lp:2560,cp0
   15:44:28.781538 send meta info suc
   15:44:28.781620 setup output suc
   15:44:28.781754 no send start, required 4, buf sent 3
   15:44:28.792076 stream 1,cmd ISP4FW_CMD_ID_SEND_BUFFER(0x02040001)(0),seq 138, ele 0000000000000000
   15:44:36.648116 stream 1,cmd ISP4FW_CMD_ID_SET_STREAM_CONFIG(0x02010001)(1),seq 139, ele 0000000000000000
   15:44:36.648380 stream 1,cmd ISP4FW_CMD_ID_SET_OUT_CHAN_PROP(0x02010003)(0),seq 140, ele 0000000000000000
   15:44:36.648440 stream 1,cmd ISP4FW_CMD_ID_ENABLE_OUT_CHAN(0x02010005)(0),seq 141, ele 0000000000000000
   15:44:36.648492 stream 1,cmd ISP4FW_CMD_ID_SEND_BUFFER(0x02040001)(0),seq 142, ele 0000000000000000
   [... SEND_BUFFER seq 143-158, all status 0, all within 2 ms ...]

What I see:

   1. SET_STREAM_CONFIG returns status 1. All other commands return 0.
   2. The answer to SET_STREAM_CONFIG always comes about 7.85 s late,
      together with the answers queued behind it (16:24:51 -> 16:24:59
      and 16:25:02 -> 16:25:10 in two v4l2-ctl starts; 15:44:28 ->
      15:44:36 above). In one start only the first answer arrived at
      all.
   3. Every stop then logs "fail to disable stream" and "fail to stop
      stream" (the synchronous commands time out).
   4. In several boots, around the first camera use, the firmware sends
      two notifications the driver does not know:
        -><- fail respid unknown respid(0x30002)
   5. Once, out of many tries, Zoom showed an image with noise, stripes
      and false colors.

It does not depend on the format or resolution: v4l2-ctl --stream-mmap
gets 0 frames for NV12 1920x1080, YUYV 640x480 and NV12 1280x720.
Reloading amd_isp4_capture does not help.

The kernel log goes back to June. The first camera errors appear on
2026-10-26, the day after the BIOS update to 01.06.02, and then in
almost every boot, with Arch's 7.2.6, CachyOS 7.2.7 and 7.3.1. The
built-in camera worked before the BIOS update.

The driver sends SET_STREAM_CONFIG with isp4if_send_command() and does
not check the result, so the start succeeds and the application waits
for frames that never come. Failing the start on a non-zero status
would at least give userspace an error.

Questions:

   - What does SET_STREAM_CONFIG status 1 mean here? Is it the sensor
     not responding, e.g. because of power, clock or GPIO setup that
     the BIOS controls?
   - What is notification 0x30002?
   - Is BIOS 01.06.02 known to affect the ISP or the OV05C10?

The full debug log of this boot is available; I can send it or run
more tests (other firmware, other options).

Before the deadlock fix, the failed start (with "fail to get out prop")
hung the process in isp4sd_stop_stream() until reboot. With Caspar's
patch on 7.3.1 that no longer happens; I'll send a Tested-by in that
thread.

Thanks,
Guido
