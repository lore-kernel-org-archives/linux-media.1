Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD10353A61
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.164
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929062; cv=pass; b=oNxmYtyUNG/fYd6HQ+n0dVVAcCLy0edNojp34qadFpF7x3iQJ+c7qN2juGeuNsaoASdKUhESrPvarWyvsiCAJi+hx/9ohQ0WR3pG763Cid0RMb3glkghN+ChEwWxafO9CH1aF1q842lJrdCLeKtD/Yzo8+e75T9j3MRx9n8GU+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929062; c=relaxed/simple;
	bh=2bMtA8WGuflkTB3SvRCnRQIgbTN4Dee/qsspXxo1/P4=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFpG1yE54EQ94mH2WCYqT7iG3GRNXtnusHGkogETsm3R3AvytQMZJOJmMueGRgMUbdpQOmH7vm970yx7xpvXeiZwAPxqSDuczbqWZFhp2HIM12IxVKZicl0tuaM+ywr5qlcN+8XHJ++p7sa/XlCgi3QsRusOcL4fssAHdXQqw2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lk6/nirF; arc=pass smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lk6/nirF"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6dd42533365so1391241eaf.2
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:17:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929059; cv=none;
        d=google.com; s=arc-20260327;
        b=FwuTi1OwygVQMxEUhpz6uO04FHAhe0RZO5w7WcMfq6QaJC8DaFTHumeSM8pgjpYg6v
         g/xuYlSfTKobi4iRaLiKGTPWjA4GiXb8oOdnZsMHXj6SNAL3wSm5Ymxw6taFEntW6Ozi
         d0pij27la/ncU28JeJyG8i7TLG/oqs0Vri+SHFkx0slBrcaOCNVCQrZ9TcSnbTaRXLuY
         Qubyklnq9HgLS1Qv3ACFKQMjdNwknhxx+RfFHPjMMrdk37atcREcXnBpCLDdlFSILduZ
         rKyko12EtINnJSKwcq1iyqIuCWMSzIdlXfL4FbtleMFvcUhdbkVo0RC4ogC7qMiGez3X
         a9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=M+1E7PWa67rGnSkrRiBVOgb+aRHknlv9AJM5+4lGxFU=;
        fh=i5i1NwwPqZi3WrU5hlZKDyYIyhVizg+l53twnbX3hXU=;
        b=qhDoBdbtYFamvIGXw095Apx2h1uqoSDVTgmKfqtfiClwCNJj8I6TZUgpawViS/qq1O
         nHR2yQyyMUFgjXGTc+bYlt9HBNaQa02Am2LBvtru7w2WGIeo9AtOlTOOs95Yo+RTEKjx
         r3aWhpyB5qTS9o5ggxtDWlAC6uysNOmGtpj8eUGhaGW6uIrHSUXOp813KmnUDfbV88hH
         i4s592GA/QunXOM4xGwCX6gZuxlWaJ3b5WyaEbZoJ6xPrXVni6b1FRGgVeXTDT23kVNu
         2pVQX7sUA8tpU4D7aBc1lOfPIKeNK+/kpEqqYd8niiW/IyjY5Wx9PSmHQ1ck4YK7F81D
         lCvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929059; x=1791533859; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+1E7PWa67rGnSkrRiBVOgb+aRHknlv9AJM5+4lGxFU=;
        b=Lk6/nirFhVlE/Mc2L0uytoof1yG3ZwGAzQE4v1cUszINqYvUkah3Hy9jCCHaWUr9JF
         u7ADfp5YYSb73vnvKaR/OkBk6W9IQ3Fw5VejYLRPDk3tMZOZVhAwG9yKF6tSBfUW9d0/
         4xJz3IyqcICRNHQGwdoPiA0O8pIRBl14A8ws6aQs9e7O3rn6y2KwaOa4n8ZpfZvGlKov
         RiEfSfBSswbP7uRypLd36K3BZ9vuKiIoOwV1nqPMR5OR/0A91SG0ix6TBeOCKNM2+CNd
         kWUwX4DEOmT6O4qr/zGIlP/ZLFL9CRP14Z2MUzq5IxwxY/3sdkn4CLsK35BI7qCbE0SN
         u/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929059; x=1791533859;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+1E7PWa67rGnSkrRiBVOgb+aRHknlv9AJM5+4lGxFU=;
        b=Dy2RqLsorMFGzBTGqURC3OnGVA0bAd4XPoQyATR3DuFDco0QvJoGjxiY240KC7nje5
         ZgX3BrAltqV2SHEur4HUem+GN/UYThW2vyQmu8IVfLMRg//mtGz80VWUScHVwsXe4jo6
         KDtWP6s4s98AF2+0i2UO3KmCS/Tl7CxwkmMBm9RPLJB3stDTh/x0HLGjpUqDjSO6PliW
         MjyHyzS6kzUPYBkThU3O4eKn1J/6mPVjuc5Ht5gOpAX2mKaz7V/QVyjRSiQ1KDxA2r+o
         PzHU+PuPiPMhacKPwnyvUs5eUOOOHs8K763To0EycBX3AKrkYHSBUuHAirqQ3y6Jn1HN
         5bMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+WAx64INWzKlmWEHyRlQZD6W2Ztinv9GfWXy+LuJlCWGE34q7CWe0At7DGeSdpxm55HD+S3gXx0SrkQ==@vger.kernel.org
X-Gm-Message-State: AFuF++md00XSTpir+OHzeLnOBTbrNbiK03Uqp189Si6LbWj3mVYwUSBi
	NB45c7oyz1B8wx48VIRiAERx7zgkym5CeziHydkcgtHnbJhJZ62xF1jaohRrWdl6lXbyY8nzSWG
	Z68ALiL7vstu7y92EWS+W95K6dlRHQ4Q=
X-Gm-Gg: AYBFou3g6bnFlSRgEO/4K/hCpWU8AzOxAMFKCZB4QvaCntY3fXgrq9KZvqTHIYX4sKc
	I9afZHCu9aal40aZHDiq0y89Y8SDzgtjliGklOc5DSxfwd8RQyiEeX1LmM2bBUit4M6wDlD7NhN
	oeia8/iYBXMy1KJMbVKQXvh3aOZf+gLvjP/7/XqTvATjwbvcWw9YF0unj3gaulvmmwGi9XpGpt5
	GLcSsTdcPj5p4ElJi1JE/9pllUcmD/iZce9qyxglu6Clni5DuoS4P/SiJtdMk02Emfdvxljr24n
	MYeI5v69gZyD+WQt0v8x5a96PJvqiGPkHIctTIixqrZ4JeyNg5jBh6O/y2kBq5j+ErECB4EorX0
	Q6qYhTqxp0zqgA19VLP86L5xhqkAhyxLi
X-Received: by 2002:a05:6820:3388:20b0:6d9:1925:1c13 with SMTP id
 006d021491bc7-6df34480c56mr1208645eaf.52.1790929059528; Fri, 02 Oct 2026
 01:17:39 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:37 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:37 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:37 -0700
X-Gm-Features: AclHuK_WmvR0Tnpx5XYH1S9QMp6yihhTqyMrupidHb-L_FKblip9CEUzcfe3aAs
Message-ID: <CAO7O_xg5+dYPXCmtzT_aUrti+hWywZyxCMn0S=yxzLarZvor2g@mail.gmail.com>
Subject: [PATCH v8 06/15] media: intel: ipu-bridge: Add Yoga Book camera sensors
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c
b/drivers/media/pci/intel/ipu-bridge.c
index 8bd20089636e..62852fe1a406 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -78,6 +78,8 @@ static const struct ipu_sensor_config
ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -109,6 +111,8 @@ static const struct ipu_sensor_config
ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV5693 */
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
