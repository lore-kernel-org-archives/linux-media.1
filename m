Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BA242A7A8
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929119; cv=pass; b=Lsv4RNVWrDNnw3UUYcuzODKcZLsv++qPtDMYVQd0uixTb5RTmobMzsrZCDZMSI8jOfJn/tXNT//IEQ5xHdHOHOIOWLVt0D4WL7W7IcwTjLgj2sjKE1fKLNbdl1cdtal2eQdatZ6QO8zbhCHstrGw4vdFB51MGDALWCqPaWuoKnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929119; c=relaxed/simple;
	bh=6Lfx0jV6IMUPHRzAdg+6UtumFBkdv73DiNbwBclrpg8=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWWCAokbvhhuvSQiEcdx08GP//XvgurLuckqFah+gNLeImKKKU7fIYdTLhud57zm5zz8OkhF+A+S4izZEaH51fsmaK7cW9wO69emSc9WqMKatoePJ15+TQLdoKPevVhFSuEpYWtqpZiDj0fP9C+Kg8AB8PLgzJWp5G9WWqMd1qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncQrTr3h; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncQrTr3h"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-81f707db14cso3695881a34.2
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929116; cv=none;
        d=google.com; s=arc-20260327;
        b=aZN+QQfaukQ/3g3691wUNH9Ucscbui5p0tOolATdIxvFbxMWugvdA/neeKa+y8DfhY
         TCeKePujXRQa6zd/0LF7FxRUOh1udER4rN4EXCj7Hi7r2peclD61DmBLvlK5NpHntCen
         Wv8x1IQWKvwb0KQb0GZ808hzhbcqlC3C9RGCHLTVAuG42vz0VgEeeD2UWs0vAou3bcDB
         LJgSdAJccEmhDqrc9IsDSc8Ojg+7cPQ4nXkwUEN5f3v7qrTkbVh6ocrVSdQCSNExSk1O
         hog0T2w6+BYSho7uByrAgHpVNAvKQj9GJydtqUgmydnGj/YNDO8vAoL8uqXy/Q+A4WFy
         FgtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=346f4gGMT/Ag85J/e8vzhaW40UWlQoH961LBrHXp4mg=;
        fh=gthikdQQLZdyttax6rZB63G3Nw9S8K5uUiknTZqStFw=;
        b=dPhQvNdCM29pRaltlu8PqnXYow+SJLulm4PwW0Jx3ugsCK7Wj7q9ZluslDYxusUGLV
         5g6K/CZT/hYmB57ezRjXvkcIqeJmxMW9qyMlWJRahcpwVR335vSWaR7GNna0HoXiQXim
         GtHqLb2G8tjVi102UMbSIXaSZElFtEzeGijEP7o04qFVtICQm2tHvFOT3a8XvyLFSIBW
         C137sM5VPJfh6ejBFTxHi6RgA17nIWB6DgY4JDAWHyC1HFArPAE/fbVy+m0sz36TSh9Y
         JK0S6JgMbaHu586t0MESf0JhhaWLFJVAAPyVr8H1JGa/n7s/1vH3vhJq4lRKhHjG4tHM
         pJwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929116; x=1791533916; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=346f4gGMT/Ag85J/e8vzhaW40UWlQoH961LBrHXp4mg=;
        b=ncQrTr3hqg5qkhxh3lNaaFZpXQqmMRsbr+I8TETpBIVLGKX/gdUtGK1Aw2G9jmQvct
         AIevKowFD4hao16uk9hKb9C91LOM0dBYJDIXNZkFghuyXZ6kSSxcQ6eUcywKdQhH5B7A
         NDzIP1lgFnDh576zPIqW7yr2skOVzZTIqckU+wdIViJHVsuOyHGdoHzzPWfWuYlwb95Z
         dWZSjb1TtuetbG9yuovHdAzyzLjDZhMP/ThAN4phzP0Yw0VDwWIsPUYheOqJEKoAqTt0
         LLvwcgzkRaJU3DpFmGu5wkFp0GRuoN8op7t4UKj1aGlCOF21YJoUUAkhiz9ZwLV/wTaW
         5DQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929116; x=1791533916;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=346f4gGMT/Ag85J/e8vzhaW40UWlQoH961LBrHXp4mg=;
        b=nsQwMAt5bgvmwIpm/oo6n4Wrh6YN6MRVijquk/vsFgFfJCqryfK+rGrQnL/7Dp/S68
         J+neXwFgQGqYQzyqQL/jyeYusWezEYrkh7E4hpkO/z5kj5cRXdEwOnqvGDsKK/VXmgZP
         FOXcWlMjMO0XamgJrtJwyU81ZY99G0T3hlDf1/I18VrcGMpb/l8u5XLawxuGSdyr0iy7
         4d7Ms2ze2UwYOgX2sTIubM3JvYyX5LF5H8fw8Wi/5QhqI3snfAsxHG+7zDhOF5a4l9xa
         cEZqcovQVI6CUzqNBnQB6xTLEyGVgu3u4fmipDOZ+guu5rMY0zMkgFq+BFrKiQcBLQHu
         prug==
X-Forwarded-Encrypted: i=1; AKwUvByHk5kpgKroIYNbI7+S1qVDIQ8yJSVw81PefyNBkVJ9tdECPC/PLW/k25ydtgtHdjWVmbZ0DazhWynIPA==@vger.kernel.org
X-Gm-Message-State: AFuF++lOd7gYupsrV3ZC+hXBqBwf/vHy5mj6Vn5Vsce+9m/z5cZjfpsq
	Q7a8p6yFMiCEbOtLywvWtAhlD5N0euz++I/8UsBW+/sawGmnPg+5pRQ/dlJpRctHGpGlQqZoHwg
	aXcP4LCdk96JcHOGRFu8RWGYgwjZTjSg=
X-Gm-Gg: AYBFou2N4opd0AA5L+1DZfOD4uioXLhK1R/QqG215FOXKLNnNr67jJwhK/8nvgH8W/V
	bg2zFcQfQ30kfF6JmIfUTcCrw5BuOjmmSfGB8f5pZq2JIl80iIz9kF736fUfwy/WbQ+4NHgh+wU
	5YBlqN57bQODudGawO7OeHK5iR1bYATmn3ucXtpJcKr1tENltPde0/RG42XldZ8B+aHLzwPYjdi
	j8ddE9DBHb5ATwZnG2nsk6X7ONMmflzON5NSK915XOXcqm+7RD2aGb14ma2tmr+Msj8XtBPMEwE
	iwweO5b7xikpcFXTLUJrlEQVAKla7tVik+tdEShIvKsIyosgDgtotoKaKC55Zz9x7uAC1L1V9uU
	cEk2eSVXP3uvwlhuGibumk2VvgzBiaOOx
X-Received: by 2002:a05:6820:c98:b0:6c9:80d8:a1ec with SMTP id
 006d021491bc7-6df348866fbmr1590818eaf.41.1790929115961; Fri, 02 Oct 2026
 01:18:35 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:34 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:34 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:18:34 -0700
X-Gm-Features: AclHuK-3038epjCFa1xon2bRGkGyxQzWMlfNfpE62dQ7SyYg30VE4d-xKNpqNFQ
Message-ID: <CAO7O_xh0emLuDf4GwVXisV6qYiMgdiDJ6Z6mBv-BC5mC59KbmQ@mail.gmail.com>
Subject: [PATCH v8 12/15] media: ov2740: add manual white balance controls
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The sensor has separate red, green and blue manual white-balance gain
registers, but the driver currently writes the same digital-gain value
to all three channels. This prevents userspace from correcting the
strong color cast of raw Bayer capture.

Expose red- and blue-balance controls relative to the digital gain and
update all three channels under group hold.

Tested on the Yoga Book OV2740 with live gain changes and continuous raw
capture.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 44 +++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 4479666f17f7..42e4cd5d1341 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -565,6 +565,9 @@ struct ov2740 {
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *exposure;
+	struct v4l2_ctrl *digital_gain;
+	struct v4l2_ctrl *red_balance;
+	struct v4l2_ctrl *blue_balance;

 	/* GPIOs, clocks, regulators */
 	struct gpio_desc *reset_gpio;
@@ -694,8 +697,10 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 	return 0;
 }

-static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
+static int ov2740_update_mwb_gains(struct ov2740 *ov2740)
 {
+	u32 d_gain = ov2740->digital_gain->val;
+	u32 blue_gain, red_gain;
 	int end_ret, launch_ret, ret;

 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
@@ -703,7 +708,11 @@ static int ov2740_update_digital_gain(struct
ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		return ret;

-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
+	/* Balance controls use 1024 as unity relative to the digital gain. */
+	red_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->red_balance->val,
+				     OV2740_DGTL_GAIN_DEFAULT);
+	red_gain = min(red_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, red_gain);
 	if (ret)
 		goto release_group;

@@ -711,7 +720,10 @@ static int ov2740_update_digital_gain(struct
ov2740 *ov2740, u32 d_gain)
 	if (ret)
 		goto release_group;

-	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
+	blue_gain = DIV_ROUND_CLOSEST(d_gain * ov2740->blue_balance->val,
+				      OV2740_DGTL_GAIN_DEFAULT);
+	blue_gain = min(blue_gain, OV2740_DGTL_GAIN_MAX);
+	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, blue_gain);

 release_group:
 	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
@@ -760,7 +772,9 @@ static int ov2740_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;

 	case V4L2_CID_DIGITAL_GAIN:
-		ret = ov2740_update_digital_gain(ov2740, ctrl->val);
+	case V4L2_CID_RED_BALANCE:
+	case V4L2_CID_BLUE_BALANCE:
+		ret = ov2740_update_mwb_gains(ov2740);
 		break;

 	case V4L2_CID_EXPOSURE:
@@ -801,7 +815,7 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	int ret;

 	ctrl_hdlr = &ov2740->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 10);
+	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 	if (ret)
 		return ret;

@@ -836,9 +850,23 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
 	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
 			  OV2740_ANAL_GAIN_MIN, OV2740_ANAL_GAIN_MAX,
 			  OV2740_ANAL_GAIN_STEP, OV2740_ANAL_GAIN_MIN);
-	v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
-			  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
-			  OV2740_DGTL_GAIN_STEP, OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->digital_gain =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_DIGITAL_GAIN,
+				  OV2740_DGTL_GAIN_MIN, OV2740_DGTL_GAIN_MAX,
+				  OV2740_DGTL_GAIN_STEP,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->red_balance =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_RED_BALANCE,
+				  1, OV2740_DGTL_GAIN_MAX, 1,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	ov2740->blue_balance =
+		v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
+				  V4L2_CID_BLUE_BALANCE,
+				  1, OV2740_DGTL_GAIN_MAX, 1,
+				  OV2740_DGTL_GAIN_DEFAULT);
+	v4l2_ctrl_cluster(3, &ov2740->digital_gain);
 	exposure_max = ov2740->cur_mode->vts_def - OV2740_EXPOSURE_MAX_MARGIN;
 	ov2740->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov2740_ctrl_ops,
 					     V4L2_CID_EXPOSURE,
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
