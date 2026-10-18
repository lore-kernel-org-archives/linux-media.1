Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F5E2AD0C
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 14:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335225; cv=none; b=kklBVJiS+T/sFFx1AcKoTpwJvpzUvyOhq9MD9kFCY8HqLG/XgSYuJ3RYA38CZEMZFusp0Y0735vGc/GkadSRpyPix7iw62JuSa5N5LoQyP9/54yKWWBr1H/suRnB6z11+u38tfsOiX9rLcpe5r3S441VITsxobEIY1V8E4f5lS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335225; c=relaxed/simple;
	bh=RL+kvymONO/njLyfOpDPHFUhbLeTjUKzMjLfPXIrS0s=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=FmnrZ+XEE/GHOXqaeecGiAW9gbL10XnwAdiTBWOtfJ338d1u25n/UjDuwea0Yv663GlGT56QzeEFgR5VCWraCe89pJjmKdKNdjXwhUyShYWTFI8o2HDmV1R7r+efoKB+obdSLO83W3NV40bmjLpxFgUx1AKVT205bY2l0tlm4nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=olleco.com; spf=pass smtp.mailfrom=olleco.com; dkim=pass (2048-bit key) header.d=olleco.com header.i=@olleco.com header.b=p8RDYsFe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=olleco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=olleco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=olleco.com header.i=@olleco.com header.b="p8RDYsFe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso5798125e9.1
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 07:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=olleco.com; s=google; t=1792335222; x=1792940022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:content-language
         :disposition-notification-to:subject:from:cc:to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OGt6jZ0bycN2m14q9/JUZhUOc34onO9VgLDa6Iy9lSQ=;
        b=p8RDYsFe58KmQ1jYfUbJgerUNmm1+JvDYiENeXtdGEmrIC4JB3rd3L4P+FxAE9sGZb
         H8maS7hbMNOD8kKplVjZGRCLQslVkmp/0gb/9v1+OkB4Bduy2SKb9UDUpCi9eKprY8kh
         R0E4d4AcrUAO057fp3zVn9ayr8r9f5dFSkZavatVXR2PVr6Rd7DTcmDNyPZvveMolBOG
         +fIyaTtovCp8UQ/yWeGJYQAiLdrtquHlz8RNNE5lhbcvDfbVi33fBvx9e21Upo+Q4HRv
         t712JnYhLitKiJ6GVBILUsNNW+Yk6ji2FE59nEPYIB0NREINIuGLgg/FzAUACd+YHFeP
         bItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792335222; x=1792940022;
        h=content-transfer-encoding:content-type:content-language
         :disposition-notification-to:subject:from:cc:to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OGt6jZ0bycN2m14q9/JUZhUOc34onO9VgLDa6Iy9lSQ=;
        b=0+eGQ8kibAw4mGWYfyga+cj/StPhNyUIT/WLx8p7SjjhCijlB8XbxVqm6qDjkQWCEJ
         Rdt4oZZ/XoCcWiY3Yt5OX4LBniQyHbOcvGW28j+3cDfZsIHfjCqdjc4BG6WkYoGe/V4Q
         Sqq3dfX7KzhM8jf7O+NfRzRn0XUY7N8w7BmfoLYgqM0dARfdbTYa969JOPtYsP6JF86O
         KdyOaIJ/pauWUsolHDZL8ryAZPKyCXngYMvGyMsrynC+qQemXsstGb7JUIbQBtMFCMfS
         n2I0GSu2QiMjdfX3mKw8fvQTr5fGhJG/pix4Dy7d8UTcJLajrLeLJQivcaNwCJ0aBsvh
         eDdg==
X-Gm-Message-State: AFq9FYIQ0vc7YfUxbLidtMLTxKHsDFdriGKwlde8VVfT9nM+NQ+pwJoL
	5XZvjarJSlZE94v17HjPpoUdghsH44X+CsH8E4ihtx8CUPX6WyQY1+OCOxGAqYx4jVTkGqKzhsv
	V0bsI58FS1psiAae3UN6d90UhYQc8XyA+7Bj4YqivumFlM3ahTHreVQiYybKBFPipgUTf/EJepZ
	97
X-Gm-Gg: AYBFou0CBC3dk6vJgWQhbIbblmW/2ysIru3znEHVlogVAF5fz1rKl8JI2DC0MLrV3PD
	LvqpEcZP3Y5ySQnP1h26zUa8oXK4WGhiwI0WDiZY48E3XPmKtZXpSKN8lvXPZnU5DMS9BwjHYdi
	nc7HIhG5bviD5wv+fwHde7zsBMmcTsH8QKI+mzlW5dX5xOcHGtFvG/Zsbim+i67nrH7Xchy2Tx9
	VPHMF9tVQwTpFzqH8ZRCm+PcmHQ580NLlFzDlunKo7vhY5siCaiYCp8TUCsy4p5vrYqbj4L8t0D
	2uUykzikYEW4QfM670qzr6RGw7g/iUiwt5Yy0FgK37wT5kzd8eZGInq+GkgaWeCqDEChPgeT3n6
	nKHISbm2mDFqUZhLVK/pmr/EYdikove8igniNFw1CnJ/uHhYXUZazdLpYZA9AXSZBc9vc3A7d1M
	29V+wMocPusHad6hzygRr6nudcKMao7SGYNY/BMMt3jziiWO7SjauBkjhxW3uW1f50RVgNwCKzX
	uO5y/uyMPxxh6bm8yXbx5M=
X-Received: by 2002:a05:600c:3b1c:b0:4a1:d248:25c4 with SMTP id 5b1f17b1804b1-4a1d76046dbmr106737535e9.13.1792335221848;
        Sun, 18 Oct 2026 07:53:41 -0700 (PDT)
Received: from [192.168.1.40] ([178.251.45.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm254089565e9.12.2026.10.18.07.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 07:53:41 -0700 (PDT)
Message-ID: <beae3dae-7716-4dd6-962c-d60ac8029323@olleco.com>
Date: Sun, 18 Oct 2026 17:53:39 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jimmy Su <jimmy.su@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
From: Olgun Karademirci <olgun.karademirci@olleco.com>
Subject: ov08x40: 1928x1088 binned mode produces no valid data on IPU7
 (2-lane), "error group 3 code 18"
Content-Language: tr, en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

On a Dell XPS 14 (DA14260, Intel Panther Lake, IPU7 PCI ID 0xb05d) with an
OmniVision ov08x40 (ACPI OVTI08F4) connected over 2 CSI-2 lanes, the
1928x1088 binned mode of the ov08x40 driver does not work. The 3856x2176
full-resolution mode works correctly at about 28.6 fps.

Environment:
 =C2=A0 - Kernel 7.2.11-200.fc44.x86_64 (Fedora 44); the same on 7.2.10
 =C2=A0 - intel_ipu7 (staging), firmware intel/ipu/ipu7ptl_fw.bin,
 =C2=A0 =C2=A0 isys/psys version 1.2.1.251215214331, commit ee59e1e0
 =C2=A0 - linux-firmware 20260916
 =C2=A0 - libcamera 0.7.2, simple pipeline handler with Software ISP
 =C2=A0 - Sensor: MEDIA_BUS_FMT_SGRBG10_1X10; frame sizes 3856x2176 and 192=
8x1088
 =C2=A0 - link_frequency menu: 0 =3D 400000000, 1 =3D 749000000 (read-only)=
;
 =C2=A0 =C2=A0 pixel_rate 320000000

Reproduce:
 =C2=A0 cam -c '\_SB_.LNK1' -s width=3D1280,height=3D720 --capture=3D10
 =C2=A0 (libcamera selects 1928x1088 on the sensor)

Result: each frame produces an ISYS error, frames arrive at about 3.6 fps
instead of 30, and the buffers are filled with 0xFFFF:

 =C2=A0 intel_ipu7_isys.isys intel_ipu7.isys.40: 06=20
IPU_INSYS_RESP_TYPE_PIN_DATA_READY stream 0 pin 0 buf_id ... frame 0
 =C2=A0 intel_ipu7_isys.isys intel_ipu7.isys.40:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error group 3 code=20
18 details [0 0]
 =C2=A0 intel_ipu7_isys.isys intel_ipu7.isys.40: 09=20
IPU_INSYS_RESP_TYPE_STREAM_START_AND_CAPTURE_DONE stream 0 pin 0 buf_id=20
... frame 0
 =C2=A0 intel_ipu7_isys.isys intel_ipu7.isys.40:=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error group 3 code=20
18 details [0 0]
 =C2=A0 intel_ipu7_isys.isys intel_ipu7.isys.40: 06=20
IPU_INSYS_RESP_TYPE_PIN_DATA_READY stream 0 pin 0 buf_id ... frame 1
 =C2=A0 ...
 =C2=A0 intel_ipu7_isys.isys intel_ipu7.isys.40: stream stop error: 18

The same capture with a size that selects 3856x2176 works without errors.

Since the full mode works on the same link, I suspect the binned-mode=20
register
list or its link-frequency, lane or timing settings do not match a 2-lane
configuration. I have not confirmed this.

Two minor issues on the same sensor:
 =C2=A0 - VIDIOC_SUBDEV_G_SELECTION is not supported. libcamera reports=20
"Unable to
 =C2=A0 =C2=A0 get rectangle 0 on pad 0/0: Inappropriate ioctl for device".
 =C2=A0 - The image is rotated by 180 degrees on this laptop.

I can test patches and provide more logs, such as dynamic debug output or
register dumps.

Thanks,
Olgun Karademirci

--=20
OLLE 	Olgun
KARADEM=C4=B0RC=C4=B0
Ankara =C3=9Cniversitesi
Teknoloji Geli=C5=9Ftirme B=C3=B6lgesi
G=C3=B6lba=C5=9F=C4=B1 - Ankara 	=C2=A0 =C2=A0 =C2=A0 =C2=A0 TEL: 	=C2=A0 =
=C2=A0 +90 312 485 20 69
GSM: 	+90 533 491 34 36
WEB: 	www.olleco.com <http://olleco.com>


--=20

https://www.olleco.com <https://www.olleco.com>


