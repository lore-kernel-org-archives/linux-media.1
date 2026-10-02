Received: from mail-oo2-f34.google.com (mail-oo2-f34.google.com [74.125.231.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAAB36212C
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929011; cv=pass; b=AiJOoizwjLd3fVDh9b0fT/wGKQcMtyLL12x7HTlCwyD6z2I4OtiqRvwGW5BuJ9QpjxYsQjqujnHzNCu+fRXXBJaR+2ojN2VIAEtBtfs1l7eXTquGhBHvLyNq4SpGlSW3wal1rouOVKwYl0c75vB/MYhabY7GyOtYaL7FxaT2AwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929011; c=relaxed/simple;
	bh=f6cYfPCRep1du6Y7pFv+a9XS5Ucy9+4wwnEfJsZZv9w=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sPMDyOt2wo+Vk+SoBYsHtZxTAqhM68zpaQRGiwXUAQnHZV1kpWwGiOLm1UNXtWFGQHOv+kWgUcrciiwpBU2vdpk3ZhiAgrpS8oZ8BRgrPv2sg8x5+Psxt8Otg4KB4QBvBQsNX0SsvIS0lLla8nqMhQUJFT3SIhkKdtqR/WWQ22c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gizdvUnt; arc=pass smtp.client-ip=74.125.231.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gizdvUnt"
Received: by mail-oo2-f34.google.com with SMTP id 006d021491bc7-6de5d816853so799708eaf.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929008; cv=none;
        d=google.com; s=arc-20260327;
        b=WZDQE9kQTB8ZaKN2G3oAIRmV7OLqo4FA9dMRBIfFSN9ciZ8TI5RCljlnFioAxu7jRJ
         FFDUs5Kv0oEdCq2M/Tvw+y/95haZliEmoPat2AfpbwlOaIln3/kyFmCfxOKIQR7HKAZV
         jBEf4ckKh6e1XvWNY5HxjtohsqaXOjT/y+ZZzcLsSu8Rxv7ogoINfk2b0IMzrmlhFPwo
         3WYFHrb5XhKZxSIL8SleMaycFg+wOnZ+RBdKKJSqKA+XK4FxW01F11kPyKkOe6aZ9fx6
         tsNiSi4cvn1CeTH1KWb6TdYi9CL1O3K1TU0+Lx/Q0IItUkP0WWk+Vv6mQAN4jVs/WK4r
         wigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=dP4tQpKjU4ldQHSlZlOQOb7IiLXIJWGfv7/HtFzzsaI=;
        fh=LKE/FlIuxktLkZKpFVL9XFn9RL3zsQH00cHswh4oFrA=;
        b=j7tIVfso+NFUTVPu1PD7KY0H4ofL4nAUJGTkRI0O6l/XG3QehmLXe1z28bYLeq7kbC
         F3cJLJ86jxoREnCMtOTqcUiLZXYynxYVv4idqA3dfT15/R47yfsjDBbe8snQTvHGYJMI
         0kIjYTCA+p5z4ir7QIJtiOuDEaqx059hRcpHqP+k7tnK4v0xaGW8xOvDeUHEu3+Y/vKH
         1oUxUVSLSuFdEo9QiFfDqZrURhAT1zqonqVIrxOu/uLo5Img0sCuSSfaquSp+5ieSl8/
         9tLQA7c68N0GEaYFTjLSb99dqm61OzWOQfK8ZDCFmwsnGSaN8fiF9yiN1f+4b7p1rzWm
         GKNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929008; x=1791533808; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dP4tQpKjU4ldQHSlZlOQOb7IiLXIJWGfv7/HtFzzsaI=;
        b=gizdvUntAbQmOwggmEe9W/f6H4IHUCQOZmYOpNBwnYh+O/47VLemegAEBfE75B6enf
         DKKcUwbgHvUSSzmm5MROWgXFYU2KcsxnNnim1z98QPcIcIhjG18uUFoJ/oHWGoKaTZxu
         FR2PvgAR08UwsBmUr7wIE1/s6D6WL6ntmvTsCi/oF5otKRu62UCWb4Qh+Ym5/n8+66kO
         2dV8oCzFbCAxSqcwpNW8KROXi4v1CkU96DtPlxit9eZ9/fSMeTaRrLSqUpO/zBfQjuKT
         GKi4yR26u3BTsUIqT2L7x+ldogtzHLfrCEj2GyHO3SJAkeJ4NSFxHCcmH8GPtOJ/CWIo
         0h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929008; x=1791533808;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dP4tQpKjU4ldQHSlZlOQOb7IiLXIJWGfv7/HtFzzsaI=;
        b=IuzeUsdljqbd9jbwW4SNVuu3nklItaAeTbtqhD/mMV9VzNAYuLBpjRuSJht07nS6KN
         qGC7t+nDko3+PcxTqdzNSscpMXGkromwHENfTXC45YWy6o1LkCDTftZj7jH6sb5o8LdA
         EjuSmZ5wQ7VF1x2GcajquSl9z82QDsLFapJ6uDa+bTPwDLhUhSom/RXH7y1VgCMn/GzU
         Q53o+oh4Qabs+dRkpRS/pKKwM3IFehAzLX9Q8IIqxKeoSdsF0rCXJPcumW8x6kolX6tF
         2YqSNypKLM7cVb2ACMFG0SdhCzGGaL6DYy0lbKgwl3CQf5/MqZ9EDt985g5m48ftKKTv
         hrPA==
X-Forwarded-Encrypted: i=1; AKwUvBwwHA7rW1sNyaYtDK4yawHFqBHSa4y/f/VXc7e4qOgVjfLOizCTUcQUGxfvz9bZLFdrVUDQsHR9oGjJvw==@vger.kernel.org
X-Gm-Message-State: AFuF++mMoOZPA3usVK9wOikUSsLnP6NiCAXa4PSUbFR/+Rm1IrQvYoZZ
	o/pa0+RuJZMzWmdGTfjSphSgLt/RXuIHogb+zXThH3ornPBkCOMkDXw/GPljAFkKIhuYBuFiAqz
	rbNy+aYllq79fxXGicpoF7blNZNcBgIg=
X-Gm-Gg: AYBFou10EkOH6eddlYgfz+1//p8VlvSZ/GcbHS3CW8ZkYIt4NzAoBVecI8NVUevBo39
	xoNR3qNEbbFq5NUDiWHNBN0SIhWwNGhl/+e+PUeyxfxSKTgjfSY5bae0UMQ5KsMUqLFDCgdm2RD
	rR+c3kh0JvLbUQpavlqWuOhJXbno7A6H01EI5yjVFMF1xhI+QRnjNzsACR24dyLLj8hjtB4NH9w
	+kCFtd3D6M77RA79v83+F95YAkoGdyHU4mYhswfMR0rwby+41U5MW4chsGupk55K1UDVIkky1gH
	aEYYIhbot0fdWdtAEmReuiAnrJY6Rfs31iovRPa283YXIv44b+CbtrvYr5qRoYNZ8zONoUa0mFP
	MbRh+r1o/3yRDTV8U0goyuIk/f3dbLknL
X-Received: by 2002:a05:6820:4de1:b0:6b7:8415:d790 with SMTP id
 006d021491bc7-6df34a7728cmr1561204eaf.59.1790929008268; Fri, 02 Oct 2026
 01:16:48 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:16:47 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:16:47 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:16:47 -0700
X-Gm-Features: AclHuK_NqDOzbPOslj65sTO9YuhX1s324JFAip5gV8V6KxpkPGtkM12CzEuoVqU
Message-ID: <CAO7O_xgGOrKZuuDWsbPD1kd+P4JHsX0T9bEVg1X=SX71OXBVOg@mail.gmail.com>
Subject: [PATCH v8 01/15] media: ov8858: Extract digital gain programming
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 0bfc4350a8c9..2a0e2b08b9aa 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1524,6 +1524,23 @@ static int ov8858_enable_test_pattern(struct
ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }

+static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	u16 long_gain;
+
+	/*
+	 * Digital gain is assembled as:
+	 * 0x350a[7:0] = dgain[13:6]
+	 * 0x350b[5:0] = dgain[5:0]
+	 * Reassemble the control value to write it in one go.
+	 */
+	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+		     OV8858_LONG_DIGIGAIN_H_SHIFT);
+
+	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1532,7 +1549,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;

@@ -1571,17 +1587,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		/*
-		 * Digital gain is assembled as:
-		 * 0x350a[7:0] = dgain[13:6]
-		 * 0x350b[5:0] = dgain[5:0]
-		 * Reassemble the control value to write it in one go.
-		 */
-		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
-			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
-			      OV8858_LONG_DIGIGAIN_H_SHIFT);
-		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
-				   digi_gain, NULL);
+		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
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
