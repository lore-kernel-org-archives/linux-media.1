Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4FF15C14F
	for <linux-media@vger.kernel.org>; Sun, 23 Aug 2026 22:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787524019; cv=pass; b=QjwAOUot7g83b6Vh05/zC4M/E8OQGnwvLiM3Cu6TebnM8Xs1OUjW+jf83GyFonhcoGmdluMNhNas7c3u348+NcfvG/I1kHa2kIV68yPBp7BTh5z7ih/S1eqP7+2JGNdLy4oK6kixIy69KzlO+9YnkhGz2A3OEGWNc2/vPw4wpD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787524019; c=relaxed/simple;
	bh=wYVCr+JAk09jXurJkn31dCHW8ddiZJZCoxIsSc1GzBQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tphC4GnGa+5TvLOAPVw7Uwj/Mp3pRKVqXz+2LJiLlozJHRwv4ZZgXAwVDwIfFJLrpy164b9YnHXXiTYgfFaoh1D+zFDt8SOOzorxtl+3Hz3JoKnU5dGwCjYTvcqPC0bubn3yaOyiAs+m1zcyzbzdVFY8WtTiN7Ed7jnUAadDnqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbvGers2; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbvGers2"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52d7a3defe8so19220761cf.0
        for <linux-media@vger.kernel.org>; Sun, 23 Aug 2026 15:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787524017; cv=none;
        d=google.com; s=arc-20260327;
        b=WMpT+XOJcTTP5qjTQq4WTxt1QhwWd8vKLjSqi0ADYpfRByqBuKXu0GOpxcAXiMRkhP
         kPkkjTWXJa7EayAmE0QJ3IDwQwYN6WmJoP5kXrq8L411oj5wNBK2SZSAmGVeOp056mVC
         CFxb4GPSdeuxIxSWLGCX6y9DstI7l88sfpLmoPMjK8F4A9IVCPB5HhZ1dCK03rGNbyr4
         D5XAF4z9rpbMnzMEm3FkTVP9buCcP3UFxGbSLhZpujW+f36/I1bJM5glFBOSVYcektvm
         VdvLNCdOhaDu2PuJKXVPrGJglTpNmhL1rhN5cn1J51B03hi9Jfv+NL9vBwKP1naBenCx
         ZJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zbJxldzOP2hhFlJufa7csxUJny627GL+KhKOiPJXeZE=;
        fh=RiPOiILXWYPY3CaitlhrWKb6HLrHryUzR41BZcJSywk=;
        b=Ifbygbnd3DzXrtbbhfiGHXRxIvliLfMA1FGdaseo66v88sQnHMwTBkGD6615oO/JIL
         ndGZJwZAiaGirN3sZvYUfp/xHeLxxmwbwH6cQAN59WYV+nVlSIJAyMtdeozbjWq4jUHo
         yVhRnV4u+xtV04uN6YjVvYfOHurIUSa/dybwGRPoFLpELZ4IOqiZzgFnYroQOiaKcPk3
         FhIeVjPltQEhLaLbUlebWJzvHFgGNU0UTjjNvv3EyxzwS73i/XWYBa80bxrS0WU07vWr
         Icxg0RvVVk5vZYbNMLRPaHRUnUWdSv5El4o/L4Sohucm7WKBndV0LcFFlhAu7DDbvX7J
         kxIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787524017; x=1788128817; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zbJxldzOP2hhFlJufa7csxUJny627GL+KhKOiPJXeZE=;
        b=MbvGers22suAU6mSNhjYvr+uS0t3Z3FAhmY/dKDYWMomm5rw5fsG90+3SRslOdwqtd
         qaP4QrBZJLQuHWn3P0kKrSf/CavN95kIQ7I2INrEI55GC8fwVXSXmqe604GZYah2CD2M
         LUH9D/2aXUHgWcRydKyrJETiwZeCXDB2ehPmrNLSxzKbHbabPMObXNZkrI6KK/Npz6k0
         DM9iov1+F5GzLcmtW/O211gcBkhZqzIgM5QsabL8W61eu3w3pIT9Gqf56syejEbfTdyl
         SXuMha+UcFC3dyNUHP0pX/JEdcsWLG4V5PgNLNKDpoCY1Ie3WIxFvRD85pqOZyhW3WEq
         Y6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787524017; x=1788128817;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zbJxldzOP2hhFlJufa7csxUJny627GL+KhKOiPJXeZE=;
        b=M1nOrTYrtEZmIphiGHDMlHbhTQiTeN2k55sS5CcyRtdFDix2DvXL4s2wp5MUYIFMh+
         WW9tPo8CF6ODgEhVERZ+ogcZHzAe8CupWAFafKtEjwoUTeAp/gmCm3vIaUdVN4rkUgec
         ElFCbf7FH7iVLxWdeUqkovnZQMOcCkkHyr8h4ml+6E4lTPLeXqoDNKjVrE7xDm1Hp8NA
         87cK3JVThJ4KHguMfznci8IaGZljQ3w+FF6bD8DPbyrMLQ7WDM7J4fiKRoPUdzgndc5h
         EeLFhH3WosIjriNtFAsBZY+JmYydsPVDgGEGsVpIq015htQaIOvPo/LjwNM4h18g/zi8
         zjBw==
X-Gm-Message-State: AFuF++lWwWcKY9lK0FpY1hGRvOe/T5/flo/9Gx15UWcpaBIYfy6/R06Z
	R9Zsq8NLwVbXVcnaP6MGRndjxPqrQpDpV6SxyBQu8Mr2G/Ycr73oTtN/zjQpM2Ccz/jhoKjA0Wd
	ExOZkk04OJvdlwHgPMMNiVt23anbwLqGEgFzLOg==
X-Gm-Gg: AR+sD13g8RP/2E2OBAAiK4ehqu+Z3OsjYR4moH3qabQlVjdtifqLFcy+wMTnC3tiLG3
	kYVmTyFRYommXHxMkmKb7AISlXeOb0bc8+kesPdZjiovtlUiqReJ5qAe0m+hokEz2H/yYal1Mhw
	lND0jZxu6Mff+oMi3zM2PwgJf47g1DHLrqgG8gDJqLcncqa7gwnAIi/nEDBWo1r8pZXwOR+BCR/
	VhfV9b2VIEQoYhS+Hvov9W3/M0qOkX499viPFNED9kUvj9WpsvWk2fNWGzIZwibB5JjNmsc23o5
	RKHDR28bjEeolpc1+rnxaR1hbDXEq0i3CSlv7f+Jf7Pzlw==
X-Received: by 2002:a05:622a:58c9:b0:51c:f8f:13d with SMTP id
 d75a77b69052e-52df5a8ea39mr236329201cf.37.1787524016572; Sun, 23 Aug 2026
 15:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Durgesh Ajgaonkar <drajgaonkar@gmail.com>
Date: Sun, 23 Aug 2026 18:26:45 -0400
X-Gm-Features: AcwNN1Wx34CuW65ma8vQU25psXEBXb82EDyRe7lzj2QDcNWrXR2GSaq68VW2Dv8
Message-ID: <CAFt93pqcefoiURczzaVTH_QxSZtmkyh3B3Z3CD0QemSsyRHopQ@mail.gmail.com>
Subject: [REGRESSION?] Intel IPU6/OV2740 camera fails to stream after camera
 use on ThinkPad X1 Carbon Gen 10
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="0000000000000982a90659be5eb8"

--0000000000000982a90659be5eb8
Content-Type: multipart/alternative; boundary="0000000000000982a80659be5eb6"

--0000000000000982a80659be5eb6
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting two problems with the built-in OV2740 camera on a ThinkPad
X1 Carbon Gen 10 with Intel IPU6:

1. When the camera is functioning, 1280x720 video is limited to
approximately 10-11 FPS.

2. After certain camera-use sequences, the camera can subsequently fail to
produce frames. In the failing state, the IPU6 ISYS/CSI2 driver reports CRC
errors, packet-header errors, FIFO overflow, frame synchronization errors,
and eventually a stream stop timeout.

The camera can work normally from a clean state, but after using the camera
through another camera application, qcam can subsequently fail to produce
frames. In the failing state, the kernel reports errors from the IPU6 ISYS
CSI2 receiver, including CRC errors, packet header errors, FIFO overflow,
frame synchronization errors, and eventually a stream stop timeout.

Hardware/software information:

- Laptop: Lenovo ThinkPad X1 Carbon Gen 10
- Camera sensor: OV2740
- Camera interface: Intel IPU6
- IPU6 PCI device: 0000:00:05.0
- Sensor ACPI/I2C identifier: INT3474:01
- Sensor I2C address: 0x36
- Normal kernel: 7.1.8-1-cachyos
- libcamera: 0.7.0+ov01a10.2
- qcam: libcamera qcam
- Distribution: CachyOS

The kernel detects the IPU6 and sensor correctly:

    intel-ipu6 0000:00:05.0: Found supported sensor INT3474:01
    intel-ipu6 0000:00:05.0: Connected 1 cameras
    intel-ipu6 0000:00:05.0: IPU6-v3[465d] hardware version 5

The media topology shows the OV2740 connected to IPU6 CSI2 port 1,
which is connected to ISYS Capture 8 (/dev/video8):

    ov2740 17-0036
        -> Intel IPU6 CSI2 1
        -> Intel IPU6 ISYS Capture 8 (/dev/video8)

The sensor/CSI2 topology reports:

    ov2740 17-0036:
        SGRBG10_1X10/1932x1092

    Intel IPU6 CSI2 1:
        SGRBG10_1X10/1932x1092

    /dev/video8:
        1932x1092 BG10

The relevant v4l2-ctl output for /dev/video8 shows:

    Driver name      : isys
    Card type        : ipu6
    Bus info         : PCI:0000:00:05.0
    Driver version   : 6.18.42
    Video Capture
    Metadata Capture
    I/O MC
    Streaming

    Format Video Capture:
        Width/Height      : 1932/1092
        Pixel Format      : 'BG10'
        Field             : None
        Bytes per Line    : 3904
        Size Image        : 4267072

A direct v4l2-ctl streaming attempt on /dev/video8 also fails in the
problematic state:

    v4l2-ctl -d /dev/video8 \
        --set-fmt-video=width=1932,height=1092,pixelformat=BG10 \
        --stream-mmap \
        --stream-count=10

returns:

    VIDIOC_STREAMON returned -1 (Broken pipe)

and produces a zero-byte output file.

This indicates that the problem is not limited to qcam's UI or camera
application. The failure also occurs when attempting to stream directly
through the V4L2 ISYS capture device.

In contrast, qcam can successfully open and stream the camera on the same
CachyOS kernel from a working state.

A successful qcam run produced:

    Found 5 IPU6 camera(s) via libcamhal
    Found IPU6 camera 0: ov2740-uf (facing=0)
    Adding camera 'ipu6-ov2740-uf-0'
    Opening camera device 0
    Camera device 0 opened successfully
    Configured HAL stream: 1280x720 NV12
    Streaming started for camera 0
    Streaming stopped for camera 0

The complete successful qcam output is attached as:

    qcam-cachyos-success.txt

The important difference is the kernel output observed during the failing
state. The IPU6 ISYS reports:

    intel_ipu6_isys.isys intel_ipu6.isys.40:
        csi2-1 error: Payload checksum (CRC) error

    csi2-1 error: Single packet header error corrected
    csi2-1 error: Multiple packet header errors detected
    csi2-1 error: Payload checksum (CRC) error
    csi2-1 error: Transfer FIFO overflow
    csi2-1 error: Incomplete long packet detected
    csi2-1 error: Frame sync error
    csi2-1 error: Inter-frame long packet discarded

Later the driver reports:

    stream stop time out
    stream close error: 3

The complete dmesg from the failing state is attached as:

    dmesg-cachyos-qcam-failure.txt

I have also observed that qcam can work when it is the first camera
application started, while subsequent attempts can fail after the camera
has been used by another camera application. I have not established
whether this ordering is required to reproduce the problem in every case,
so I am reporting it as an observed condition rather than a definitive
cause.

The failure appears to leave the IPU6 CSI2/ISYS path in a state where the
sensor is detected and the media topology remains present, but streaming
cannot successfully start or complete.

For comparison, the sensor is correctly detected and the media links are
present in the failing state. The relevant topology is:

    ov2740 17-0036
        -> Intel IPU6 CSI2 1 [ENABLED, IMMUTABLE]
        -> Intel IPU6 ISYS Capture 8 (/dev/video8) [ENABLED]

I would appreciate advice on which component is responsible for this
failure and whether this points to an IPU6 ISYS/CSI2 driver issue, an
OV2740 sensor driver issue, or an interaction with the IPU6 userspace
HAL/libcamera implementation.

I can provide the complete media-ctl topology, v4l2-ctl output, additional
kernel logs, and reproduction details if needed.

Thank you.

--0000000000000982a80659be5eb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,=C2=A0</div><div><br></div><div>I am reporting =
two problems with the built-in OV2740 camera on a
ThinkPad X1 Carbon Gen 10 with Intel IPU6:=C2=A0</div><div><br></div><div>1=
. When the camera is functioning, 1280x720 video is limited to
   approximately 10-11 FPS.=C2=A0</div><div><br></div><div>2. After certain=
 camera-use sequences, the camera can subsequently
   fail to produce frames. In the failing state, the IPU6 ISYS/CSI2
   driver reports CRC errors, packet-header errors, FIFO overflow,
   frame synchronization errors, and eventually a stream stop timeout.</div=
><div><br></div>The camera can work normally from a clean state, but after =
using the camera<br>through another camera application, qcam can subsequent=
ly fail to produce<br>frames. In the failing state, the kernel reports erro=
rs from the IPU6 ISYS<br>CSI2 receiver, including CRC errors, packet header=
 errors, FIFO overflow,<br>frame synchronization errors, and eventually a s=
tream stop timeout.<br><br>Hardware/software information:<br><br>- Laptop: =
Lenovo ThinkPad X1 Carbon Gen 10<br>- Camera sensor: OV2740<br>- Camera int=
erface: Intel IPU6<br>- IPU6 PCI device: 0000:00:05.0<br>- Sensor ACPI/I2C =
identifier: INT3474:01<br>- Sensor I2C address: 0x36<br>- Normal kernel: 7.=
1.8-1-cachyos<br>- libcamera: 0.7.0+ov01a10.2<br>- qcam: libcamera qcam<br>=
- Distribution: CachyOS<br><br>The kernel detects the IPU6 and sensor corre=
ctly:<br><br>=C2=A0 =C2=A0 intel-ipu6 0000:00:05.0: Found supported sensor =
INT3474:01<br>=C2=A0 =C2=A0 intel-ipu6 0000:00:05.0: Connected 1 cameras<br=
>=C2=A0 =C2=A0 intel-ipu6 0000:00:05.0: IPU6-v3[465d] hardware version 5<br=
><br>The media topology shows the OV2740 connected to IPU6 CSI2 port 1,<br>=
which is connected to ISYS Capture 8 (/dev/video8):<br><br>=C2=A0 =C2=A0 ov=
2740 17-0036<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 -&gt; Intel IPU6 CSI2 1<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -&gt; Intel IPU6 ISYS Capture 8 (/dev/video8)<br><=
br>The sensor/CSI2 topology reports:<br><br>=C2=A0 =C2=A0 ov2740 17-0036:<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 SGRBG10_1X10/1932x1092<br><br>=C2=A0 =C2=A0 I=
ntel IPU6 CSI2 1:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 SGRBG10_1X10/1932x1092<br>=
<br>=C2=A0 =C2=A0 /dev/video8:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 1932x1092 BG1=
0<br><br>The relevant v4l2-ctl output for /dev/video8 shows:<br><br>=C2=A0 =
=C2=A0 Driver name =C2=A0 =C2=A0 =C2=A0: isys<br>=C2=A0 =C2=A0 Card type =
=C2=A0 =C2=A0 =C2=A0 =C2=A0: ipu6<br>=C2=A0 =C2=A0 Bus info =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 : PCI:0000:00:05.0<br>=C2=A0 =C2=A0 Driver version =C2=A0 : 6=
.18.42<br>=C2=A0 =C2=A0 Video Capture<br>=C2=A0 =C2=A0 Metadata Capture<br>=
=C2=A0 =C2=A0 I/O MC<br>=C2=A0 =C2=A0 Streaming<br><br>=C2=A0 =C2=A0 Format=
 Video Capture:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Width/Height =C2=A0 =C2=A0 =
=C2=A0: 1932/1092<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Pixel Format =C2=A0 =C2=A0=
 =C2=A0: &#39;BG10&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Field =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 : None<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Bytes per=
 Line =C2=A0 =C2=A0: 3904<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Size Image =C2=A0 =
=C2=A0 =C2=A0 =C2=A0: 4267072<br><br>A direct v4l2-ctl streaming attempt on=
 /dev/video8 also fails in the<br>problematic state:<br><br>=C2=A0 =C2=A0 v=
4l2-ctl -d /dev/video8 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --set-fmt-video=3Dw=
idth=3D1932,height=3D1092,pixelformat=3DBG10 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 --stream-mmap \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 --stream-count=3D10<br><=
br>returns:<br><br>=C2=A0 =C2=A0 VIDIOC_STREAMON returned -1 (Broken pipe)<=
br><br>and produces a zero-byte output file.<br><br>This indicates that the=
 problem is not limited to qcam&#39;s UI or camera<br>application. The fail=
ure also occurs when attempting to stream directly<br>through the V4L2 ISYS=
 capture device.<br><br>In contrast, qcam can successfully open and stream =
the camera on the same<br>CachyOS kernel from a working state.<br><br>A suc=
cessful qcam run produced:<br><br>=C2=A0 =C2=A0 Found 5 IPU6 camera(s) via =
libcamhal<br>=C2=A0 =C2=A0 Found IPU6 camera 0: ov2740-uf (facing=3D0)<br>=
=C2=A0 =C2=A0 Adding camera &#39;ipu6-ov2740-uf-0&#39;<br>=C2=A0 =C2=A0 Ope=
ning camera device 0<br>=C2=A0 =C2=A0 Camera device 0 opened successfully<b=
r>=C2=A0 =C2=A0 Configured HAL stream: 1280x720 NV12<br>=C2=A0 =C2=A0 Strea=
ming started for camera 0<br>=C2=A0 =C2=A0 Streaming stopped for camera 0<b=
r><br>The complete successful qcam output is attached as:<br><br>=C2=A0 =C2=
=A0 qcam-cachyos-success.txt<br><br>The important difference is the kernel =
output observed during the failing<br>state. The IPU6 ISYS reports:<br><br>=
=C2=A0 =C2=A0 intel_ipu6_isys.isys intel_ipu6.isys.40:<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 csi2-1 error: Payload checksum (CRC) error<br><br>=C2=A0 =C2=A0 =
csi2-1 error: Single packet header error corrected<br>=C2=A0 =C2=A0 csi2-1 =
error: Multiple packet header errors detected<br>=C2=A0 =C2=A0 csi2-1 error=
: Payload checksum (CRC) error<br>=C2=A0 =C2=A0 csi2-1 error: Transfer FIFO=
 overflow<br>=C2=A0 =C2=A0 csi2-1 error: Incomplete long packet detected<br=
>=C2=A0 =C2=A0 csi2-1 error: Frame sync error<br>=C2=A0 =C2=A0 csi2-1 error=
: Inter-frame long packet discarded<br><br>Later the driver reports:<br><br=
>=C2=A0 =C2=A0 stream stop time out<br>=C2=A0 =C2=A0 stream close error: 3<=
br><br>The complete dmesg from the failing state is attached as:<br><br>=C2=
=A0 =C2=A0 dmesg-cachyos-qcam-failure.txt<br><br>I have also observed that =
qcam can work when it is the first camera<br>application started, while sub=
sequent attempts can fail after the camera<br>has been used by another came=
ra application. I have not established<br>whether this ordering is required=
 to reproduce the problem in every case,<br>so I am reporting it as an obse=
rved condition rather than a definitive<br>cause.<br><br>The failure appear=
s to leave the IPU6 CSI2/ISYS path in a state where the<br>sensor is detect=
ed and the media topology remains present, but streaming<br>cannot successf=
ully start or complete.<br><br>For comparison, the sensor is correctly dete=
cted and the media links are<br>present in the failing state. The relevant =
topology is:<br><br>=C2=A0 =C2=A0 ov2740 17-0036<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -&gt; Intel IPU6 CSI2 1 [ENABLED, IMMUTABLE]<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 -&gt; Intel IPU6 ISYS Capture 8 (/dev/video8) [ENABLED]<br><br>I wo=
uld appreciate advice on which component is responsible for this<br>failure=
 and whether this points to an IPU6 ISYS/CSI2 driver issue, an<br>OV2740 se=
nsor driver issue, or an interaction with the IPU6 userspace<br>HAL/libcame=
ra implementation.<br><br>I can provide the complete media-ctl topology, v4=
l2-ctl output, additional<br>kernel logs, and reproduction details if neede=
d.<br><br>Thank you.</div>

--0000000000000982a80659be5eb6--
--0000000000000982a90659be5eb8
Content-Type: text/plain; charset="US-ASCII"; name="qcam-cachyos-success.txt"
Content-Disposition: attachment; filename="qcam-cachyos-success.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mt6dmjis0>
X-Attachment-Id: f_mt6dmjis0

WzA6MTM6MjguNTkzNzU5ODUzXSBbNjY2Ml0gIElORk8gQ2FtZXJhIGNhbWVyYV9tYW5hZ2VyLmNw
cDozNDAgbGliY2FtZXJhIHYwLjcuMCtvdjAxYTEwLjIKWzA4LTIzIDE4OjEzOjM4LjE5NV0gQ2Ft
SEFMW0lORl0gYWlxYiBmaWxlIG5hbWUgT1YyNzQwX0NKRkxFMjNfQURMLmFpcWIKWzA4LTIzIDE4
OjEzOjM4LjE5Nl0gQ2FtSEFMW0lORl0gYWlxYiBmaWxlIG5hbWUgT1YyNzQwX0NKRkxFMjNfQURM
LmFpcWIKWzA4LTIzIDE4OjEzOjM4LjE5N10gQ2FtSEFMW0lORl0gYWlxYiBmaWxlIG5hbWUgQVIw
MjM0X1RHTF8xMGJpdHMuYWlxYgpbMDgtMjMgMTg6MTM6MzguMTk3XSBDYW1IQUxbSU5GXSBhaXFi
IGZpbGUgbmFtZSBBUjAyMzRfVEdMXzEwYml0cy5haXFiClswOC0yMyAxODoxMzozOC4xOTddIENh
bUhBTFtJTkZdIGFpcWIgZmlsZSBuYW1lIEFSMDIzNF9UR0xfMTBiaXRzLmFpcWIKWzA4LTIzIDE4
OjEzOjM4LjE5N10gQ2FtSEFMW0lORl0gYWlxYiBmaWxlIG5hbWUgQVIwMjM0X1RHTF8xMGJpdHMu
YWlxYgpbMDgtMjMgMTg6MTM6MzguMTk3XSBDYW1IQUxbSU5GXSBhaXFiIGZpbGUgbmFtZSBBUjAy
MzRfVEdMXzEwYml0cy5haXFiClswOC0yMyAxODoxMzozOC4xOTddIENhbUhBTFtJTkZdIGFpcWIg
ZmlsZSBuYW1lIEFSMDIzNF9UR0xfMTBiaXRzLmFpcWIKWzA4LTIzIDE4OjEzOjM4LjE5OF0gQ2Ft
SEFMW0lORl0gYWlxYiBmaWxlIG5hbWUgQVIwMjM0X1RHTF8xMGJpdHMuYWlxYgpbMDgtMjMgMTg6
MTM6MzguMTk4XSBDYW1IQUxbSU5GXSBhaXFiIGZpbGUgbmFtZSBBUjAyMzRfVEdMXzEwYml0cy5h
aXFiClswOjEzOjI4Ljc4MDQ2NDMyNl0gWzY2NjddICBJTkZPIElQVTYgaXB1Ni5jcHA6NzE0IEZv
dW5kIDUgSVBVNiBjYW1lcmEocykgdmlhIGxpYmNhbWhhbApbMDoxMzoyOC43ODA0OTM5MzhdIFs2
NjY3XSAgSU5GTyBJUFU2IGlwdTYuY3BwOjE3NSBGb3VuZCBJUFU2IGNhbWVyYSAwOiBvdjI3NDAt
dWYgKGZhY2luZz0wKQpbMDoxMzoyOC43ODA1MTIxOTBdIFs2NjY3XSAgSU5GTyBDYW1lcmEgY2Ft
ZXJhX21hbmFnZXIuY3BwOjIyMyBBZGRpbmcgY2FtZXJhICdpcHU2LW92Mjc0MC11Zi0wJyBmb3Ig
cGlwZWxpbmUgaGFuZGxlciBpcHU2ClswOjEzOjI4LjgxMjc5MDYxN10gWzY2NjJdICBJTkZPIENh
bWVyYSBjYW1lcmEuY3BwOjEyMTYgY29uZmlndXJpbmcgc3RyZWFtczogKDApIDEyODB4NzIwLU5W
MTIvc1lDQwpbMDoxMzoyOC44MTI5MDQ5ODBdIFs2NjY3XSAgSU5GTyBJUFU2IGlwdTYuY3BwOjIz
MiBPcGVuaW5nIGNhbWVyYSBkZXZpY2UgMApbMDoxMzoyOC44MTgzMDc2MjddIFs2NjY3XSAgSU5G
TyBJUFU2IGlwdTYuY3BwOjI0MCBDYW1lcmEgZGV2aWNlIDAgb3BlbmVkIHN1Y2Nlc3NmdWxseQpb
MDoxMzoyOC44NzAyMzQ5ODldIFs2NjY3XSAgSU5GTyBJUFU2IGlwdTYuY3BwOjI3NiBDb25maWd1
cmVkIEhBTCBzdHJlYW06IDEyODB4NzIwIE5WMTIsIHN0cmVhbV9pZD0wIHNpemU9MTM4MjQwMApV
c2luZyBzb2Z0d2FyZSBmb3JtYXQgY29udmVyc2lvbiBmcm9tIE5WMTIKWzA6MTM6MjkuMzY3Mzcx
NTY0XSBbNjY2N10gIElORk8gSVBVNiBpcHU2LmNwcDozMjcgU3RyZWFtaW5nIHN0YXJ0ZWQgZm9y
IGNhbWVyYSAwClswOjE0OjEyLjIyNDQ0MzEyM10gWzY2NjddICBJTkZPIElQVTYgaXB1Ni5jcHA6
Mzc0IFN0cmVhbWluZyBzdG9wcGVkIGZvciBjYW1lcmEgMApbMDgtMjMgMTg6MTQ6MjEuNzAwXSBD
YW1IQUxbV0FSXSBGYWlsZWQgdG8gb3BlbiBmaWxlIC9ydW4vY2FtZXJhL292Mjc0MC11Zl9WSURF
Ty5haXFkLCBlcnJvciBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cg==
--0000000000000982a90659be5eb8
Content-Type: text/plain; charset="US-ASCII"; name="dmesg-cachyos-qcam-failure.txt"
Content-Disposition: attachment; filename="dmesg-cachyos-qcam-failure.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mt6dmjk01>
X-Attachment-Id: f_mt6dmjk01

WyAgICAwLjcwOTE1N10gU0NTSSBzdWJzeXN0ZW0gaW5pdGlhbGl6ZWQKWyAgICAwLjg1NTMzNF0g
QmxvY2sgbGF5ZXIgU0NTSSBnZW5lcmljIChic2cpIGRyaXZlciB2ZXJzaW9uIDAuNCBsb2FkZWQg
KG1ham9yIDI0NSkKWyAgICA0Ljk0MDEyMV0gaW50ZWwtaXB1NiAwMDAwOjAwOjA1LjA6IGVuYWJs
aW5nIGRldmljZSAoMDAwMCAtPiAwMDAyKQpbICAgIDQuOTYxODkyXSBpbnRlbC1pcHU2IDAwMDA6
MDA6MDUuMDogRm91bmQgc3VwcG9ydGVkIHNlbnNvciBJTlQzNDc0OjAxClsgICAgNC45NjIxMTZd
IGludGVsLWlwdTYgMDAwMDowMDowNS4wOiBDb25uZWN0ZWQgMSBjYW1lcmFzClsgICAgNC45NjI5
MDldIGludGVsLWlwdTYgMDAwMDowMDowNS4wOiBTZW5kaW5nIEJPT1RfTE9BRCB0byBDU0UKWyAg
ICA0Ljk4MDI4Ml0gaW50ZWwtaXB1NiAwMDAwOjAwOjA1LjA6IFNlbmRpbmcgQVVUSEVOVElDQVRF
X1JVTiB0byBDU0UKWyAgICA1LjA0OTc0MF0gaW50ZWwtaXB1NiAwMDAwOjAwOjA1LjA6IENTRSBh
dXRoZW50aWNhdGVfcnVuIGRvbmUKWyAgICA1LjA0OTc0Nl0gaW50ZWwtaXB1NiAwMDAwOjAwOjA1
LjA6IElQVTYtdjNbNDY1ZF0gaGFyZHdhcmUgdmVyc2lvbiA1ClsgICAgNS4wODQxMTZdIGludGVs
X2lwdTZfcHN5czogbG9hZGluZyBvdXQtb2YtdHJlZSBtb2R1bGUgdGFpbnRzIGtlcm5lbC4KWyAg
ICA1LjA4NDEyMl0gaW50ZWxfaXB1Nl9wc3lzOiBtb2R1bGUgdmVyaWZpY2F0aW9uIGZhaWxlZDog
c2lnbmF0dXJlIGFuZC9vciByZXF1aXJlZCBrZXkgbWlzc2luZyAtIHRhaW50aW5nIGtlcm5lbApb
ICAgIDUuMDk5MDQzXSBpbnRlbF9pcHU2X3BzeXMucHN5cyBpbnRlbF9pcHU2LnBzeXMuNDA6IHBr
Z19kaXIgZW50cnkgY291bnQ6OApbICAgIDUuMDk5NDIwXSBpbnRlbF9pcHU2X3BzeXMucHN5cyBp
bnRlbF9pcHU2LnBzeXMuNDA6IHBzeXMgcHJvYmUgbWlub3I6IDAKWyAgICA3Ljg5NDc0Ml0gb3Yy
NzQwIGkyYy1JTlQzNDc0OjAxOiBzdXBwbHkgQVZERCBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJl
Z3VsYXRvcgpbICAgIDcuODk0ODQ5XSBvdjI3NDAgaTJjLUlOVDM0NzQ6MDE6IHN1cHBseSBET1ZE
RCBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgpbICAgIDcuODk0ODY1XSBvdjI3NDAg
aTJjLUlOVDM0NzQ6MDE6IHN1cHBseSBEVkREIG5vdCBmb3VuZCwgdXNpbmcgZHVtbXkgcmVndWxh
dG9yClsgIDQ5NS4yMDk5NzldIGludGVsX2lwdTZfaXN5cy5pc3lzIGludGVsX2lwdTYuaXN5cy40
MDogY3NpMi0xIGVycm9yOiBQYXlsb2FkIGNoZWNrc3VtIChDUkMpIGVycm9yClsgIDQ5NS42MzEy
MDJdIGludGVsX2lwdTZfaXN5cy5pc3lzIGludGVsX2lwdTYuaXN5cy40MDogY3NpMi0xIGVycm9y
OiBTaW5nbGUgcGFja2V0IGhlYWRlciBlcnJvciBjb3JyZWN0ZWQKWyAgNDk1LjYzMTIxN10gaW50
ZWxfaXB1Nl9pc3lzLmlzeXMgaW50ZWxfaXB1Ni5pc3lzLjQwOiBjc2kyLTEgZXJyb3I6IE11bHRp
cGxlIHBhY2tldCBoZWFkZXIgZXJyb3JzIGRldGVjdGVkClsgIDQ5NS42MzEyMjFdIGludGVsX2lw
dTZfaXN5cy5pc3lzIGludGVsX2lwdTYuaXN5cy40MDogY3NpMi0xIGVycm9yOiBQYXlsb2FkIGNo
ZWNrc3VtIChDUkMpIGVycm9yClsgIDQ5NS42MzEyMjVdIGludGVsX2lwdTZfaXN5cy5pc3lzIGlu
dGVsX2lwdTYuaXN5cy40MDogY3NpMi0xIGVycm9yOiBUcmFuc2ZlciBGSUZPIG92ZXJmbG93Clsg
IDQ5NS42MzEyMjhdIGludGVsX2lwdTZfaXN5cy5pc3lzIGludGVsX2lwdTYuaXN5cy40MDogY3Np
Mi0xIGVycm9yOiBJbmNvbXBsZXRlIGxvbmcgcGFja2V0IGRldGVjdGVkClsgIDQ5NS42MzEyMzFd
IGludGVsX2lwdTZfaXN5cy5pc3lzIGludGVsX2lwdTYuaXN5cy40MDogY3NpMi0xIGVycm9yOiBG
cmFtZSBzeW5jIGVycm9yClsgIDQ5NS42MzEyMzRdIGludGVsX2lwdTZfaXN5cy5pc3lzIGludGVs
X2lwdTYuaXN5cy40MDogY3NpMi0xIGVycm9yOiBJbnRlci1mcmFtZSBsb25nIHBhY2tldCBkaXNj
YXJkZWQKWyAgNDk1LjY2NDc1OF0gaW50ZWxfaXB1Nl9pc3lzLmlzeXMgaW50ZWxfaXB1Ni5pc3lz
LjQwOiBjc2kyLTEgZXJyb3I6IE11bHRpcGxlIHBhY2tldCBoZWFkZXIgZXJyb3JzIGRldGVjdGVk
ClsgIDQ5NS42NjQ3NzddIGludGVsX2lwdTZfaXN5cy5pc3lzIGludGVsX2lwdTYuaXN5cy40MDog
Y3NpMi0xIGVycm9yOiBQYXlsb2FkIGNoZWNrc3VtIChDUkMpIGVycm9yClsgIDU1MC4zODkyNTJd
IGludGVsX2lwdTZfaXN5cy5pc3lzIGludGVsX2lwdTYuaXN5cy40MDogc3RyZWFtIHN0b3AgdGlt
ZSBvdXQKWyAgNTUwLjQ4NDA0NV0gaW50ZWxfaXB1Nl9pc3lzLmlzeXMgaW50ZWxfaXB1Ni5pc3lz
LjQwOiBzdHJlYW0gY2xvc2UgZXJyb3I6IDMK
--0000000000000982a90659be5eb8--
