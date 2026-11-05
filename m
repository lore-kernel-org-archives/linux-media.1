Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.92.124.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906469;
	b=PsEuO+/paaZC1t9MXEe3d/zaIVeuyqXWLM04F1pFhmCK8i1cVObaToDubJroNkjgJ22W
	 TckrGvrOaK8yi1mPl4lqY71m+IHFWvOnU9ufMbbkdOW+3LGJVYq1Zz+neAO3kOifGkIjm
	 FBcGibIOFux8bHCVxjFqdfyfTaSvSLapnOb+Ig6wzHxrTQY3/51IA12uezV4xVzbWovy8
	 fEkKH99FBdOQLnGWGxCA1n2eQAK9FdI68cJZ5g0dZL1JGIy4k+OkR3mIkOGMWMgb8QtD+
	 NE91XbZwn2UA7VBFh5+4Rx0BvTrxX1ysm9UKor27db1Ka5JyzwWQeC8ZgpV87iXV1sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906469;
	h=DMARC-Filter:X-mail-filterd:Received:X-mail-filterd:X-lpn-mailing:
	 X-lpn-spamrating:X-lpn-spamlevel:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 DKIM-Signature;
	bh=7dNl1xdn5NlUfVmAHxn9dZ0wQPKkP1wek6kXrOOUYS4=;
	b=CbEpbtLBMPnRTtiF5NX2Hz144ZYt2i98vufrFOU5dE9+Dr7LQgwyEZxZRffUuRZo/F/x
	 laTb08I3nPavsj5hAlSN/HoxoVw7qXgMxlzx8PqPryiStcjOFpk0PgXZtHg/ogyGRCYeb
	 BDVI95yMswUAmXBIhrS/g/95zTS8smJw3G1HrdK6kLjkWctpT0WqLhjDEFyJT2GNDdwOt
	 7FUMzJWsylSR4OlG3j4JDuxBkN7/9LA0OxsEdYWAGIaJV2IgDesYz7WFCi10ekAyNyBJL
	 3aYn9Bxm6Xq5ar5atA9ir2niYaZKIk9QLJ+egKJ+ugrUUZKSO5tsha7/mb/2nCm9oNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=laposte.net;
	spf=pass smtp.mailfrom=laposte.net;
	dkim=pass header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=loSG7rQt;
	arc=none smtp.remote-ip=160.92.124.110
Received: from smtp-outgoing-2003.laposte.net (smtp-outgoing-2003.laposte.net [160.92.124.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1910606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 19:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1910606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256 header.s=lpn-wlmd header.b=loSG7rQt
X-mail-filterd: {"version":"1.9.7","queueID":"4jLBx525p4z16Hmf","contextId":
 "ba9da2f8-147a-4edf-b301-8e15cdb59711"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0105.laposte.net (SMTP Server) with ESMTP id 4jLBx525p4z16Hmf;
	Thu,  5 Nov 2026 20:20:57 +0100 (CET)
X-mail-filterd: {"version":"1.9.7","queueID":"4jLBx447kbz16Hmd","contextId":
 "504bbaaa-893a-455b-989a-e55294e901fb"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from [10.188.175.39] (238.178.71.37.rev.sfr.net [37.71.178.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0105.laposte.net (SMTP Server) with ESMTPSA id 4jLBx447kbz16Hmd;
	Thu,  5 Nov 2026 20:20:56 +0100 (CET)
Message-ID: <5bb49b41-368c-4889-9f56-9a477e85694f@laposte.net>
Date: Thu, 5 Nov 2026 20:20:56 +0100
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
Subject: Re: libcamera: pipeline: simple: Disable packed mono for VGA sensors
 on Intel IPU6/IPU7
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Milan Zamazal <mzamazal@redhat.com>, Sakari Ailus <sakari.ailus@iki.fi>,
 Robert Mader <robert.mader@collabora.com>,
 libcamera-devel@lists.libcamera.org, linux-media@vger.kernel.org
References: <c218b8a2-9e69-4ef3-b36c-7df7e7637d4d@laposte.net>
 <3a98bb5e-a4c4-40b7-ad4d-1b251c03b4ff@oss.qualcomm.com>
 <20261101164311.GA3368923@killaraus.ideasonboard.com>
 <304e2a5a-f8d8-427d-84f5-b6f4498452df@laposte.net>
 <20261101195019.220940-1-fernandorimoli11@gmail.com>
 <6cfa9260-b48d-484e-9c88-b75feb0392f9@laposte.net>
 <20261105004652.147540-1-fernandorimoli11@gmail.com>
Content-Language: fr
From: Alain Cousinie <alain.cousinie@laposte.net>
In-Reply-To: <20261105004652.147540-1-fernandorimoli11@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1793906460; bh=0i042QAtwP4Qdkve9fr0e5g+1AlzLJH9UF4UX4Mdb7s=; h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=loSG7rQtkyV2c43Vmten7VzcZzOQGFYTQQsiwt8il1/YDNrssh2ExkXGZl5uI+HDSutpu3crNAbz4R5zrcLqmILwvHcDUuyiOLjxB0VASPPS2xrNjT5rdyjCFLVPfOjVvhFU5yuk5p0LnBqiyPs9OkH6rM1YeVoUSZe7HnHTFjE0Br2jzm6CKcxLX4JMlF9eQcHqp72QGbzmd+gW9iTIjNabqU0BDIl1+blgVJDTajykEJeC5QhACuP8NFDmk+71E2lM4e+z2uINiBygOMFOKnSgHiKQ18FFegifpb93SijlaVrWFeWUVUMcg4rfNZ6ZFTZDooK+VfCsoIPDXQN+Cw==;

Le 05/11/2026 =C3=A0 01:46, Fernando Rimoli a =C3=A9crit=C2=A0:
> Hi Alain,
>=20
>> I am using an HP Spectre with an Intel i7-155H processor.
>> The camera relies on IPU6 and uses the `og0va1b` sensor,
>=20
> So Meteor Lake, which also answers Sakari's question about the system.
>=20
>> I modified the driver to include the ACPI entry `IPU_SENSOR_CONFIG("OV=
TI00AB", 1, 500000000)`
>> and adjusted the frame rate to 240 fps for a 640x480 resolution.
>=20
> Your failing run changes several things, the link frequency, the
> frame rate and the formats. The stock ipu6-isys already offers R10_CSI2=
P
> for a Y10_1X10 bus. That is what I used, with an unmodified isys, so
> nothing needs adding for that. Does R10_CSI2P at 640x480 still time out
> at the driver's 60 fps, with only your bridge entry? If it works there,
> the stall comes with the rate or link frequency, not the stride.
>=20
> Fernando

Hi Fernando,

Thank you for your feedback. I have re-tested everything using a clean,=20
standard compilation (-O2) to eliminate any compiler-induced optimization=
=20
side effects.=20

Furthermore, I have reverted all my frame rate and link frequency modific=
ations=20
to stick to the driver's stock 60 fps. My only active kernel patches now =
are the=20
ACPI match in the driver and the bridge entry itself (480 MHz), as shown =
in the=20
diff below.

The results remain exactly the same: packed mode systematically stalls an=
d=20
triggers DMA timeouts, while unpacked mode works flawlessly.=20

To toggle between packed and unpacked modes during my tests, I simply inv=
erted=20
the conditional check in libcamera's pipeline validator (simple.cpp):

--- a/src/libcamera/pipeline/simple/simple.cpp
+++ b/src/libcamera/pipeline/simple/simple.cpp
@@ -1262,7 +1262,7 @@ CameraConfiguration::Status SimpleCameraConfigurati=
on::validate()
                    captureSize.width >=3D maxRawStreamSize.width &&
                    captureSize.height >=3D maxRawStreamSize.height) {
                        if (!pipeConfig_ || captureSize < pipeConfig_->ca=
ptureSize ||
-                           (captureSize <=3D pipeConfig_->captureSize &&=
 !curCfgPacked && !newCfgPacked)) // alcousin
+                           (captureSize <=3D pipeConfig_->captureSize &&=
 !curCfgPacked && newCfgPacked)) // alcousin

By default, libcamera picks the packed configuration, which causes the ca=
mera=20
to stall immediately=E2=80=94this is precisely why I initially reached ou=
t to Hans.

Here is the dmesg log from the failing packed run (default libcamera beha=
vior):

[   86.809872] og0ve1b i2c-OVTI00AB:00: supply avdd not found, using dumm=
y regulator
[   86.809908] og0ve1b i2c-OVTI00AB:00: supply dovdd not found, using dum=
my regulator
[   86.809915] og0ve1b i2c-OVTI00AB:00: supply dvdd not found, using dumm=
y regulator
[  199.217293] intel_ipu6_isys.isys intel_ipu6.isys.40: stream stop time =
out
[  201.233140] intel_ipu6_isys.isys intel_ipu6.isys.40: stream close time=
 out
[  201.233411] intel_ipu6_isys.isys intel_ipu6.isys.40: buffer list not e=
mpty, needs isys reset

As discussed, the 640x480 resolution in 10-bit packed format (R10_CSI2P /=
 Y10_1X10)=20
produces exactly 800 bytes per line (640 * 10 / 8). Since 800 is not a mu=
ltiple of 64=20
(800 / 64 =3D 12.5), the IPU6 ISYS DMA engine fails to align the burst tr=
ansfers. This=20
locks up the internal hardware queue, forcing the "needs isys reset" stat=
e.

Conversely, forcing the unpacked format through the libcamera hack yields=
 1280=20
bytes per line (640 * 2). Because 1280 is perfectly aligned on a 64-byte =
boundary=20
(1280 / 64 =3D 20), streaming functions flawlessly.

This rules out the frame rate or link frequency, proving that the stall i=
s=20
fundamentally a hardware-level stride alignment issue on Intel IPU6, and =
it=20
validates your recent patch proposal to disable packed mono for VGA senso=
rs on this platform.

Here is the exact patch applied to my kernel tree for this test:

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index e7cd0f72f3e5..7983288a32c1 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -980,8 +980,11 @@ static int og0ve1b_probe(struct i2c_client *client)
=20
        og0ve1b->dev =3D &client->dev;
        og0ve1b->data =3D i2c_get_match_data(client);
-       if (!og0ve1b->data)
-               return -ENODEV;
+        if (!og0ve1b->data) {
+                og0ve1b->data =3D device_get_match_data(&client->dev);
+                if (!og0ve1b->data)
+                        return -ENODEV;
+        }
=20
        v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
        v4l2_i2c_subdev_set_name(&og0ve1b->sd, client,
@@ -1116,6 +1119,13 @@ static const struct dev_pm_ops og0ve1b_pm_ops =3D =
{
        SET_RUNTIME_PM_OPS(og0ve1b_power_off, og0ve1b_power_on, NULL)
 };
=20
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id og0ve1b_acpi_ids[] =3D {
+        {"OVTI00AB", (uintptr_t)&og0va1b_data},
+        { /* sentinel */ }
+};
+#endif
+
 static const struct of_device_id og0ve1b_of_match[] =3D {
        { .compatible =3D "ovti,og0va1b", .data =3D &og0va1b_data },
        { .compatible =3D "ovti,og0ve1b", .data =3D &og0ve1b_data },
@@ -1128,6 +1138,7 @@ static struct i2c_driver og0ve1b_i2c_driver =3D {
                .name =3D "og0ve1b",
                .pm =3D &og0ve1b_pm_ops,
                .of_match_table =3D og0ve1b_of_match,
+                .acpi_match_table =3D ACPI_PTR(og0ve1b_acpi_ids),
        },
        .probe =3D og0ve1b_probe,
        .remove =3D og0ve1b_remove,
diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/int=
el/ipu-bridge.c
index 3739c4a2a8c4..8f3a5eaea00d 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -90,6 +90,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
        IPU_SENSOR_CONFIG("INT3537", 1, 437000000),
        /* Lontium lt6911uxe */
        IPU_SENSOR_CONFIG("INTC10C5", 0),
+       /* Omnivision OG0VA1B */
+       IPU_SENSOR_CONFIG("OVTI00AB", 1, 480000000),

Best regards,
Alain

