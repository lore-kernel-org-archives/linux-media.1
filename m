Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFE8353A61
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929071; cv=pass; b=Ah/yd7b+WbiavjTLHNZ3mqmNEpjkXoVFVYT+KTZcj7bMsI+hueP+rD1VazwUqNDzKACekJ7jczKeJlPi8snbdQyh3Z/tbZfts1yYim8J12Nn3NiAE63oDEbN9wlQx+828U9bADVB5VZGvhCoiaEJ1FoDu5cXDPs4qne5i7Odg5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929071; c=relaxed/simple;
	bh=b7u6ms5Kn41L+dhwtIf0hPmwp8vzNweXFMOb2u0yicw=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e2cwULrFsQvRbjtDBuC2epIoLy7+dic1+uSjHBif+FagQfGenZIZU0YR5cOsVaAhtyIHBUA5pFCCpEnFVViENKoJqKSwW9Uv2bHmejNbKmbGUsFE3T7I6erAAtF1sL7JM+DExRGwjjMypco7Z6PM8AMyJaC017rogEfR/5nnT9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9qYWU77; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9qYWU77"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-8226a912bc9so958561a34.2
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929068; cv=none;
        d=google.com; s=arc-20260327;
        b=iVIqYuy3vYa+bweRMHLRReAGet18unperhu3FKdIJsFO/kgWuqk4sb/HX//Au+pIcn
         JtiMOom+PFMVxbBATF9Mm70UmfE10EYeHWx75ebmZKqYPfGygWTPpTfM8FWG1iZlhoBm
         qVToyDfGI9dWvteOkudZkY3IGcfgyBryKdleeNIHBI1wsMRtDesaHLM/PeK+sy/zUG1B
         Sp0a0r8tp+no7vDgeiff8sp1KwdgwiFiHDWeYlTYpCySiAAT+Io+403jV8cGyXKwMvmH
         kk7umit3iu0gjclIsLp0y+qKqXd04vENNEe16qQubhn8g7JZnHS1fdfPPk2XQfcrL3Yq
         9dwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=qoH/7SdQ8OfbpSRw3KkFi+BkVsoYo5VaXFwLNXgWpzo=;
        fh=wmjdGJKepip1BCkvwIT7t6HZQvgMq4taqUY/ZG++5RE=;
        b=rQ/OrdT1/gIPqqsEPSVjiYVIuMRTMkqSx0O6kzefehFVysXBO9w+IcvDzjxpOnPhzP
         ClSQFu1VPHYAIhnOY6thKOXFCnncyRDNkPCZPnLfU4wQbzlI5C9ZjVIDWUHnR+RLj+EA
         ncD/2oy/AQ+9zT5OdfLymNmtBuYirPmF3mp08NtvwwJ9Bgxaxl5g+WDjx7x0EcTD3kNZ
         coNGswl2SnmS8hPOCMlDplq7fQB2pTQannfGA50f9XI+QB1SN9S10CLpvbIvm3aFUwdD
         Z6rGMaFaYZYB61FpYwzevRsF/DzyneNl4G1/iRLtYytFTGieWJ/Bw155y4xGOYZbBQdk
         BQDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929068; x=1791533868; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoH/7SdQ8OfbpSRw3KkFi+BkVsoYo5VaXFwLNXgWpzo=;
        b=n9qYWU77x+6HNR3uWRFzij6k044CllGBteTnHQbRUJ9YZKK6jqsc7pEst+Ak64wyXS
         /5NOGeE9D8j04lX4rsp8YKhK4WZ2uKcyrip1WD/wALxdhj/HYFgpcbl5ZiMwQiX7kE1a
         u2DLlR/hFY74zpOe9OcPGlpollFHOFylujIBX93Mp6/tw/Erw/HH0zuE2WhxZqZDomPb
         RVVjsc9WEArJqyUWI9s/MQxiLQc5X6B5a/Td3NrcIIDaAp3MNqoWbi+juh3JNh6Awqup
         BYSysYLsDHVYPS+5CNXIpj/7DdCSlgFrjVkDhf0n5Kdex2kllDq0WElTs4Ed3N17Zd2K
         wOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929068; x=1791533868;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qoH/7SdQ8OfbpSRw3KkFi+BkVsoYo5VaXFwLNXgWpzo=;
        b=TNOTogw21kSsoyTwTW8oqSzPnvmMeSddvnwP6sPhPf84sl+DMIyWne8wRkGgCowTC6
         dWMWDzSZ0l2rVUZBmVTRLQoNSUoo5NI9ZHae8yQ0qnhuXxf9i0peRVKU/LXUPva05Q9n
         BsgQpS++c+1gmsNOkMarfT4dyLnYIWferEM590NeuhEtRTkcCKlEMPsZEyfcwZvUtroX
         enM3N8FnnW5Z2AUk6htZj6+4vCjqV5sAuoCYig9cHKFuicjdGKYPNCAdhKOlXUVn7CBP
         fHiF4BpQrfLyxyQvD99DaG1gEJk76kVKVhged+5uLac8N3jaBGw7q0F2YtaAv+Pr7yXa
         d0Yg==
X-Forwarded-Encrypted: i=1; AKwUvByMOEhRqWx6t0qB9d3PooP5Ri8v+85yGqvPOZRPL1O6ZLlafQf8gVo4UWVYvm4Fd310+FXBfA2Jrb4ZDQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kdCOtVeawzoBk+w5T4Q8GfPwZxjtEbd+VqU3k8A5lFiq+X26rH
	sa+1cWp0qOfFOrqK4rqdXZ1rEZuWKqcXi9oZWYYIq4LzPNwzq15cDXoFKdj6mAr5Fq2AMdrJpZU
	rOgUydBtQRiMAmZMurKSuyJaRBKnVlVs=
X-Gm-Gg: AYBFou19QwQgKEZwbbSmYPcX4PlVbD4+Kjc/l0TS8CO6pnY2gUQgFH+DR4i+y9apc0m
	RrmbIRCGY+XEJSKj0vUjSymuYZ4v38M+sUrbi4Vt9iTGnOruGyks/pveP8oOGBsYEQHPsZdOb6c
	DTXtrsddEiXZKYhjj1/P1uQWILvkEP45e6ZEs0SaZ+wg+90Fxxet54UmRcv2+UIxZI+Q8PaG45R
	xRpIx+0FFzGTax2TEnfDX1hl8UA2L2rSxBEM51Y+62adZcTYK1u6+36rZq+vYIxGZ8gr36NHEpM
	MB/9VbzG82docq3UTtv+oOv3N/VqWbI4BOsLoEGHcSjVB/9Hg9ObSCkfBRlKazOKninGpknfDJT
	a1Lt8xiMMvHSV72247zh46Xoe47S72Q6h
X-Received: by 2002:a05:6820:1527:b0:6c3:2390:c293 with SMTP id
 006d021491bc7-6df341909bemr1497792eaf.32.1790929068351; Fri, 02 Oct 2026
 01:17:48 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:47 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:47 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:47 -0700
X-Gm-Features: AclHuK94sf6-8POpQCO1mj6Jk4Vhv0wy6XkoJiDnIey6glgtlnk02WmTfcpubNw
Message-ID: <CAO7O_xjcyeJcY060STXqG53nsLaKdhxeeHEHDUXbp8Wvj6OA1A@mail.gmail.com>
Subject: [PATCH v8 07/15] media: atomisp: Add Yoga Book camera configuration
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..56da454f0d9e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };

+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };

 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -359,7 +373,10 @@ static const struct acpi_device_id
atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };

-- 
2.53.0



On Fri, 02 Oct 2026 01:15:55 -0700, mauriziocasciano7@gmail.com wrote:
> Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
> an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
> and a WV517S rear-camera lens actuator.
>
> The series adds the missing ACPI and bridge configuration, selects the
> OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
> AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
> capture and adds the sensor controls and actuator driver needed by the
> hardware.
>
> Runtime validation used the same 15-patch content on the current
> media_stage.git master. The final media-committers.git next rebase changes
> only three source line wraps needed by the media 80-column check:
>
> - W=1 builds and sparse builds of all eight affected objects passed both
>   before and after the rebase.
> - A full x86_64 Debian binary package build passed and produced kernel
>   7.3.0-rc1-yogabook-media-v8-20261002-001605.
> - The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
>   8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
>   both sensors bound and AtomISP registered two cameras.
> - OV8858 digital, red and blue gains were changed during streaming and
>   read back correctly. Continuous raw capture produced changing frames
>   from both sensors (6/8 unique rear samples and 8/8 unique front
>   samples), including front-to-rear-to-front switching without OV8858,
>   I2C or CSI errors.
> - Both front and rear cameras were also exercised successfully with
>   Cheese.
> - v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
>   40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
>   control enumeration, stream-parameter and buffer tests. These failures
>   remain a validation limitation; this series does not claim to make the
>   staging AtomISP driver fully compliant.
>
> Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
> 24 MHz paths received build and static-analysis coverage but were not
> tested on separate hardware.
>
> ---
> Changes in v8:
>
> - Keep patch 2's commit message focused on the implementation, remove the
>   invalid review Link and move runtime results to this cover letter.
> - Express OV8858 frequencies with HZ_PER_MHZ/HZ_PER_KHZ, name clock
>   tables by their input and link frequencies, and remove platform names
>   from the sensor driver.
> - Explain that V4L2 exposes standard red and blue balance controls but no
>   standard green-balance control, so green remains the unity reference.
> - Replace the per-sensor link-frequency override with the IPU bridge's
>   existing PCI-ID matching mechanism. Add an 8086:22b8-specific OV2740
>   288 MHz entry before the generic 360 MHz fallback. This removes the
>   associated AtomISP hand-off patch and reduces the series to 15 patches.
> - Add the introducing commit to the OV2740 group-hold fix and mark it for
>   stable backporting.
> - Use the documented Assisted-by tag syntax.
> - Keep the padding helper as a normal static function and avoid a
>   single-use raw-format descriptor structure.
> - Retain Andy's Reviewed-by tags only where the corresponding patches did
>   not change materially. In particular, drop the tag from the redesigned
>   IPU bridge frequency patch.
>
> v7: https://lore.kernel.org/linux-media/cover.1788360629.git.mauriziocasciano7@gmail.com/
>
> Maurizio Casciano (15):
>   media: ov8858: Extract digital gain programming
>   media: ov8858: support 19.2 MHz clock and manual white balance
>   media: ov2740: Use C99 initializers for ACPI IDs
>   media: ov2740: Add OVTI2740 ACPI ID
>   media: ov8858: Add INT3477 ACPI ID
>   media: intel: ipu-bridge: Add Yoga Book camera sensors
>   media: atomisp: Add Yoga Book camera configuration
>   media: ov2740: support 288 MHz link frequency
>   media: intel: ipu-bridge: select OV2740 frequency by IPU ID
>   media: atomisp: derive CSI-2 timing from sensor link frequency
>   media: ov2740: release group hold after gain write errors
>   media: ov2740: add manual white balance controls
>   media: atomisp: Use struct v4l2_area for padding
>   media: atomisp: allow raw Bayer capture
>   media: i2c: Add WV517S lens actuator driver
>
>  MAINTAINERS                                   |   1 +
>  drivers/media/i2c/Kconfig                     |  11 +
>  drivers/media/i2c/Makefile                    |   1 +
>  drivers/media/i2c/ov2740.c                    | 114 +++++++--
>  drivers/media/i2c/ov8858.c                    | 221 ++++++++++++++----
>  drivers/media/i2c/wv517s.c                    | 208 +++++++++++++++++
>  drivers/media/pci/intel/ipu-bridge.c          |  13 ++
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  81 ++++---
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |  19 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  32 ++-
>  .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
>  14 files changed, 605 insertions(+), 129 deletions(-)
>  create mode 100644 drivers/media/i2c/wv517s.c
>
>
> base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
>
> With Best Regards,
> Maurizio Casciano
> --
> 2.53.0
