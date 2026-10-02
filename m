Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEF4353A61
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929053; cv=pass; b=frTiER7iXF5w2mc4PoldaJBewv1XPta4lNopmQzIG7xAZufNEHqZVVezyeNK3581LgKnhc/9QiGWT6lVAuxeZmJ2i7eJzBDL4hIWhOG6RTROSJjAI4RFqC5tnHz3KFL2mEtKocte0Y0bP9Mb3Ippxy6OVhXBqbi9q8UfZHu0hg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929053; c=relaxed/simple;
	bh=yP0Uvka0dBVEPB/Ts+qYbZsrtI1Iq4TR9VK1IZ5/J2M=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qXvj1XB+6b9GFwQEN0H0L3NU8VJqQk8O4O0yGv8DcCIxTzUwr4AnOgQaPzGTHY7CREODqxH0oaBQWIQmhhmmCxL/dfbtsVdg8Cy5vZriXFc1yCqaWelTGBpdAUYw9YoWBsX/Z36PYPPG26qSbApUQ1/1Xr2z2aMgnvO5HjtKcoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHAN25Ua; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHAN25Ua"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6c8f6a53fabso2754763eaf.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929050; cv=none;
        d=google.com; s=arc-20260327;
        b=RBZ+J4o1PWDGliFDZ3D83zEJMGYjjJSpgsDjm83EwWZmNfSgNKmAIOoZLGyXb3UuA0
         LcX/uuAFIHXF5O8W2EVA9e3gGFmFe8JL3gGRV6KiUn4QkAhstKng83v34VqZks4UltEk
         9dHdlNFxFq9VsZnXPVDEMjzyU65z0CbDQNguloJ8wxrUttF5Thakw/A2d65o21wGBBVV
         WXzG8Jd7yTg2o7USxRmkssxWUa/PS3+a5/FMQkrAoNXLI378WJ2IfehyrBWx4KaFDT3I
         IInOcqBrhE04mj3Ezl44D0VRTptgF14wmHBboH59xYMl67F83R/YCJGXcgiJtaN+NcQ7
         Av7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=nAaf6vnA5XQ9vnvtvU/bvGUXPo3uUVdVfKvAyLZjyh8=;
        fh=se5F8/eoqFFHwMf6dknw99fdf2noc+Eh/UhflMtN1c0=;
        b=r1ruRpqDDuFDK0gYVYW7ax/rc2eJagUjUa+MKCVlKQK5Tm4iQDeEp/27fX5myyyTJT
         lLB/7mUqPTdU/h3uXSHMFmr9M7N6pekTqsO2WbVO9qa/aIJAS0RjuF8gLzOX7+pNeEXk
         s1iPCf71AH6V1CgjB7bfLyMbk4pNKjd9rOVHc/MF7lOQt2LslurB8fh6pjq1BqxieQGb
         Hp9uSJVdUZFVbQqHOfmKYIRmeW3ZPr8T5oLDRR2ygBgBGOTfVYA4Aj7D6AAll4O4fCpX
         UjoUNC4T5E0YdywccnBVyFmiywmPIWB95L/BZrSljr+i6fZ4O29pncReH19+iQs++Vy0
         2M5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929050; x=1791533850; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAaf6vnA5XQ9vnvtvU/bvGUXPo3uUVdVfKvAyLZjyh8=;
        b=dHAN25UaDD6GIg2AaK6g25ePNhkTejmVkWbhnbIv9fq0N1wIUuwrzyvk2OkW4sekUn
         OfBR6zMcdY7U9SlronmorLdJbVZQR7YyQY268QUh1a0nGF8c/rHvzRNbt9ONeawRxjdn
         /RurAq4sfeK6FVZDmedzaEkUNOYqravsaXkRooxm059KKxcV0npLiDVMCw+tZaMkyaOt
         /SMetuPDklMSEDzhIxzpjKStQdPLyzrJXVSkwF7w2TXlbQvC+OIuBDRKq3uRl0rSqEen
         ZUMS2CQGTF9eJUeKTFNKkOWJ6s2zCPF5m3DZl3Df6goAy7Gdwc7mLkA4uZAVQGGhoVhC
         niUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929050; x=1791533850;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nAaf6vnA5XQ9vnvtvU/bvGUXPo3uUVdVfKvAyLZjyh8=;
        b=ME31e5XHkUAjGMpv9KZ4uWorL6p9irFMLSqmZy4CnXg9kbwFb+9Epl1M4pWFoKln0u
         8KUEMS2Im+1KKaoeddutrVfhrC8/LLZj1twFjbUd1weXcCPIKQNzNymRq4aIXNO+uWM2
         olQ0JLhDsMled+3ASkbfIepF/dVu16Xhtp/ctFJU6hI9qCJtrsHC0hkJdKfSR7nnfk5p
         UoVKU8CtXKETmLGTJIArUdP8BWO7rz5JbHeIQGsJ3WVP33tpwb9uqMcMHgdFzLKYLgPh
         +obzblhBRt39degYeWXXY74C2wwJERrRj0gZvN3IytdcXp94iUL/PjP1xnLkF8HflOKC
         oEAA==
X-Forwarded-Encrypted: i=1; AKwUvBykFS2scdlpjj7HRLo02DUCU2Is1C0N+VG53sO1Z3BCpUbiIC+nLk6hEMmg90c9p2+UwSLjh4FACDiSDA==@vger.kernel.org
X-Gm-Message-State: AFuF++mOzVdGlL9C3xvLf3x/pVvWT0h/Q8iqTUYROQvEvY6AauUD80T6
	p2xG+CzqiYrS4dYMQn1n19gj7HjfvlUgnoDM/WOlghblRVzxOX+twkuXLceEg1EVbOgh8IkIsIk
	P80eYZMa+DJ+oTbpMMECWtwJ7V4B49rE=
X-Gm-Gg: AYBFou1tOg3eTwHw2BlQeJdemqv3PBRpe8wLIh8qRIJUp7nW6NEqLrgZ3csT4drs8eG
	EjJlsHGO1IVBZ7c12YXC1J2fNXPwA6qjG0S9CY3qgMvvYfAbry7om6deU58fS1Q8jDoJOe1BwwI
	3qH19zKo4399oSgNRqmFpMHqpgrMpV3Vi59+2Lnm6n5jFoIWduuK+FT2ANErbDkNqoSc2fq4UHq
	wHe/3uKv7VgK0Kui1jAlus6Og8MQXBkkVHcBXNL8YzWVROhh1gjUgt8iiBgvpO1Ve49WWu5ceG7
	5iLkP5ltZ4n8kWxXha0J2XgJFmr4/HzsitLpaYWpibqEZdg4uwQaM8GSWIaJ0UgbX7UDJhDpgn/
	YtdyLECsgNSR0a+pfkBIdMGnos85py/FbERbLSMTR+YUZ
X-Received: by 2002:a05:6820:4d0b:b0:6d3:abd1:9b87 with SMTP id
 006d021491bc7-6ddbbc00bfbmr3849611eaf.45.1790929049888; Fri, 02 Oct 2026
 01:17:29 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:28 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:28 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:28 -0700
X-Gm-Features: AclHuK-LkFsJIx5Cbfw0ls1bBDJPniprCrmiLQY6zRB0q00k-eSSW4zhDq20kFk
Message-ID: <CAO7O_xiWyfnnxh4OrnKCAFtsx=e-187sAW_Vj+Tmii_F_u8tfQ@mail.gmail.com>
Subject: [PATCH v8 05/15] media: ov8858: Add INT3477 ACPI ID
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 97bcadda3fd8..ed6d3e1cdf7d 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */

+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2093,6 +2094,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }

+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2103,6 +2110,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
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
