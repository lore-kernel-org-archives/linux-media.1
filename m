Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9168236728F
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 20:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780432879; cv=none; b=ZzrH4tgyJRuwYgNxtqj2ORop4hG4c1eMdrAM/ctfARc6bqrjCu8m6C4wPWIExRGbr9YXajSLZ2sjSYC31axmBvOmXFIsaqI3iaEKfwO1MkLaeAwxIbYNvne0jQYI9q2RGFo6d5v1zs5vS7Hf2d2j0hfaaLfENs1ltHGUWHkQN9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780432879; c=relaxed/simple;
	bh=xsLT5OcaShIZrS7CgU/h1Dm3OU7hnuHPLBlyQSwNJc4=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=mUCIM0JttoZDGNUfuFN0HuH6V1N2MhRSLeWGu9HsEA1YpryFi4ctpP8sfKI0hnYpCqSDi4Hw456NgY5MN1YPCjgYt/1FRF1Nyk4DOoE2h7Xb36HBGc9sHy+ya14Ersx6nW7imvmj/P6ueWVsEtZCY9GrtA1p/gN3RoAyaNu/4lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNF3uDsI; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNF3uDsI"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5174a3d9598so29388551cf.3
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2026 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780432877; x=1781037677; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DewtHgF1EaZQpfFWzfonb7Vo15d+LvFDmtlyP+CXrVM=;
        b=oNF3uDsIVf5PeGizCgh0hwDMJ5i/Iw/4UDp95vPA3x/StsgKSuzfWl15l+Xi7K/5m4
         HV1llKwZuL/kvtAc0f+Q9tUOPIzVHFeYZnxwpI84gY0l2e99z3IQkoX/0e1iTnUVh46p
         GNWDdSPUasaWM/Kmh0R9xQbLKZW2LCouCtdcUrZ9kYe1MIftXWg2cZ1ngpblnHXg1Bnt
         FwLFx1lNDY5Py6itbbGPfDiB56V0M4lyatrR35BEeaw40GghWqP52xZAGu95sYdywhR0
         tNean3U8S1w0evDJhM2qW08db7Mcq+7E374hWlVsrNUOOFWmgFVmBEL1YlVAFYjBwuut
         dsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780432877; x=1781037677;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DewtHgF1EaZQpfFWzfonb7Vo15d+LvFDmtlyP+CXrVM=;
        b=qPTlXcd83iUPko1aqS6LeI79YVcSu0MfAaCh2TJtiSIocARD9y1ElfkRjxIIj33lDl
         FODSpndYyqj/wYOplGxc4aEZYGdqyiH/mlGShyEfrHXLW8FxKHa/GrjwGYL0iBtHZrv1
         JFuEsk5KKJLGn5iSjius6HA9SrBSnjjpnSqF772gwbzzwak+M6aAVOhUd2s5tjC1Digz
         Un5jp2KwpznLQqtL2bPm662+Zfv740wcNBAbcCEUR5KzkRzSH2A1bw3yqwrI0CnlwH3k
         53naWeTM7KyvspXYuUrDjuiOoEaDe3JPauOWi4RHcnLHIEUrHI/FxpJSbQmHfUpkLtNv
         rZEg==
X-Gm-Message-State: AOJu0YyTc93q8jvveXgwpiRfpUIz4jva5VHfJfKOOMJ7VMd/eW7QGuy/
	R7aRgrGipf7XLcRIIAqIv/2UKh6L8ud5LLRGEt4v36oeXL/kuA5+rA6FCJwODi7W
X-Gm-Gg: Acq92OFhZUEwIq1IcuOTSwttkfuq0C2fgTvaSVO8qOoRsU+hoKDLlrOOb+aNDox1Tyi
	VXyPHGIPj5TAahHCu/hkqeOn1ZvlcVXdRsi2ECjKFmnxkX50eG/LZO6QH3vZ5b+GtESpUva5zOn
	mu7q3Wx3TlHD72EnfqVmTaO0dYju9KULp3+a0VnSPeA1P04Vn/+WJRMlxjHFTrgqIuLmbmE6Vwo
	XhU9X1FTT71MrKX2zAXjV2AFyBGPHXyWmTwtwikwgCRA0iWUSmnDlvgKMBPz9cpv0U2U2Rs+Ygl
	NBq6TXhpkXPIanRFgXK7UzvRWIsw8zjIP7A5GNkq6mr42oOOu4/MsS8ilXy27L1admKrY3XG7ak
	h2oCMdfR6waeEUet24QfYgwjMwWKnSfezl01Y2AbYwz4cfqaKycnSy53AZECzJ8ybGbANxROxA5
	a4H4leIsQ0yh11TYI8/2leL/T77gInWHHXPR8AuVstOodeXehT2B1dYImvoOAmtZDpBg3FqiQcF
	fk=
X-Received: by 2002:a05:622a:2ca:b0:517:146e:30ec with SMTP id d75a77b69052e-51778782a1dmr10251411cf.59.1780432877553;
        Tue, 02 Jun 2026 13:41:17 -0700 (PDT)
Received: from smtpclient.apple ([104.39.165.68])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd053032sm1866566d6.24.2026.06.02.13.41.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2026 13:41:17 -0700 (PDT)
From: Shuangpeng <shuangpeng.kernel@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: [BUG] media: ttusb-dec: kmemleak reports dvb_frontend_private leak
 after frontend registration failure
Message-Id: <D1EE37E7-8CCB-4621-8105-0229FADF5855@gmail.com>
Date: Tue, 2 Jun 2026 16:41:06 -0400
Cc: linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: mchehab@kernel.org
X-Mailer: Apple Mail (2.3864.600.51.1.1)

Hi Kernel Maintainers,

I hit the following kmemleak report while testing current upstream =
kernel:

kmemleak: unreferenced object in dvb_register_frontend

on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/e8dd4867a7b7907c1857ca732e7d56e5

I=E2=80=99m happy to test debug patches or provide additional =
information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

unreferenced object 0xffff88816510b000 (size 1024):
comm "kworker/0:0", pid 9129, jiffies 4295084343
hex dump (first 32 bytes):
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
backtrace (crc 2b918277):
__kmalloc_cache_noprof (./include/linux/kmemleak.h:44 mm/slub.c:4575 =
mm/slub.c:4899 mm/slub.c:5415)
dvb_register_frontend (./include/linux/slab.h:950 =
./include/linux/slab.h:1188 drivers/media/dvb-core/dvb_frontend.c:3024)
ttusb_dec_probe (drivers/media/usb/ttusb-dec/ttusb_dec.c:1695)
usb_probe_interface (drivers/usb/core/driver.c:396)
really_probe (drivers/base/dd.c:? drivers/base/dd.c:709)
__driver_probe_device (drivers/base/dd.c:871)
driver_probe_device (drivers/base/dd.c:901)
__device_attach_driver (drivers/base/dd.c:1029)
bus_for_each_drv (drivers/base/bus.c:500)
__device_attach (drivers/base/dd.c:1101)
device_initial_probe (drivers/base/dd.c:1156)
bus_probe_device (drivers/base/bus.c:613)
device_add (drivers/base/core.c:3706)
usb_set_configuration (drivers/usb/core/message.c:2268)
usb_generic_driver_probe (drivers/usb/core/generic.c:250)
usb_probe_device (drivers/usb/core/driver.c:291)


Best,
Shuangpeng=
