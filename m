Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2C93E451B
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929110; cv=pass; b=SdWGvnR0jSPLAHc9Li4w9JsT5FyBai0RQwPQty/xoNzSeKq8R/V085Q8dMIx5GFblZvKbsFI/ZdDkirE3NBKEOTnSsxUN49jWpuHQjbaBn2PwYt+7BVXjLqICd0V8GBVhEvtRiTknuPEP4Vbo5dUdxl+51U1cY5K6P49vLO34nU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929110; c=relaxed/simple;
	bh=cGjU7/FhsAzIZkR5AqbDl7sNf/YZPkCSUa+7leu9fzo=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwgvm2dbh2bEi8Qu6Niuwsv85wGUIR00qO3Z5Q8Kg70eII0oxPo/h0je1C6ecmba62iZ1x60zUCIM6BBlVPWOKLBS4CtDDW/bNRUT3WFD1rILb8pPzCAAloG0gGBXiB0qh+NeT7NJN164DWdydXRe5CUVhT/JQoMwdsTbL5LOW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLNedNAa; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLNedNAa"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-8209a96e0e3so1422159a34.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:18:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929106; cv=none;
        d=google.com; s=arc-20260327;
        b=hlsi0K5ZmGZTmgoza4mD6TCAeJccTFUFOidJoD2VlwCT46W2jGu3WW2ySzcUh1YEg0
         cQbbUmBgQ3RS8/S6U7tZE+gzNbWLlyP2EGSHxS6FtFZmJsp3IStnIVPM8LnhzjU8osXr
         fE5I3SVHj70ilGmDuLPbXfXwfGxYLIKgmt/qE+PR8z+3pYfZnY+kdrDzUOikRDHcSvdN
         Ju4XQzR3aN2/qqZ3TumayLlYJp1G7otW6QHlq4M3b5WH48ipYDPK3nP3XLlrxYIEw2v4
         BqYtq8PPLTHY52xdd3opjdwuGHoWZKlDS6zNUo4kALisNT5ZRitqAV4VOtEqyHUaJOaK
         nopQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=H+2eVhcyFYQvB6WR8E2rcLotxSCxNoAdRJ7uo5dqC0k=;
        fh=DCOgtZcwoiyGkcBkRr1ZaCDfq0nOYM0Ixyq4MQzjuBk=;
        b=VbgpBra7cdsT6VYT2C7f/u8xxTb1L0i1C/a733q0PEBsFerbjaL4Wusv5t2rHN+1nN
         W6sRscTfQ9p5ID8BT5QJnqIABcqwsyeQxL3cJqq0K/w/5xIk83zMFC8wnquwAyA22A3n
         KS9MKhcWcjpspcJwPYSEDOZW5JwTHWfJp0KFc/de8/QzsWltgyzMDUphFCaIJ0dUrFD/
         KwhPBi+BSA2ggqdfMF3uF0VXEhVOk9Xz0eW2BbNmpTbayI3svkowjQPyR+wDAu1RGc2O
         g54Rkz29Uig8Stg1M4UZgIXOza0PYyVdydHS9bFIxH3Eda3Dh+fjVRf3VizrqSJtRA0f
         jwrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929106; x=1791533906; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+2eVhcyFYQvB6WR8E2rcLotxSCxNoAdRJ7uo5dqC0k=;
        b=VLNedNAac4mu0nXxzlnt8l/DhvFhWLZxEMuz7FZAhRqnviz4UnI4gfujatLX4ktEQp
         WT72q5wYEdbq//MMa6uKs/715Zl6KJeTAxVBsbneR5Moemex2J94New8w56wZCw9AlRd
         N/Y8a243dllaRfS/2OnbmJtK5DAw6MhX2JxfYST4PNT7cIP54CHcPw6Dx8dOSmK5hp8g
         MgWBdPEp6BeBc+J/Ccbo1z2s0Qa5Su3yjdiXlfGQHXfMWg9MrPe7B8MgWB8k3MHm2PqA
         2zLr3VbArj/em2U1QzRvStBkgLgj8ZXqwWGdQbeema3kuLfwtwSSaYMjfkXI4JRYTvOP
         J7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929106; x=1791533906;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H+2eVhcyFYQvB6WR8E2rcLotxSCxNoAdRJ7uo5dqC0k=;
        b=Js6aIjgU6s8hHyDX2Xy7AbiPb3sh/4gpUnEHOh5O2IPT8CdaWeSyKpoaBgU9vm3AaJ
         LA0SlxBp5sUHTU62wT9uH0hIZG4FI/rsenQgu8A3QCSlNmONKTd1Z6y5iQ+/my71HXa2
         +NOPgWNptyZW3MiX68nmoq4vwc2EJ3jHJPDAbuLx59wRdThsMXZ72XQlX+8R0xDTGxLv
         RbZExuyy1mjrVy2kRZaeoijHml5ZlTLRl8ENmdSiLshyIYvrDgbl4FN/J7/AmrGLL1uS
         dTfiMmpj+YbIwjA/gfknXcUc1uxBRezJvqGoEeoA7fbFupSdrnMXb40/RKST0HI/+joh
         q3tg==
X-Forwarded-Encrypted: i=1; AKwUvBxiXhUTT5wZvyZqtR3s8brF+IIISj5LfZfDB5GGIuadj1rdlFrrI0/QiSrW8mTloYSXnKLIJSLPk9ls7g==@vger.kernel.org
X-Gm-Message-State: AFuF++ntrTuZBi4wlftfBjEnhXoJxY6f5tD5bteOHEugggLGd8tedvRc
	d9ZJ7lRj3uXB+uFXpuvcot7/rHRm0ycYh868b2zvCaOT5BwR2ewI/rh2LeyyDwLHq4CbCxRaBMg
	oCd4Zb2ZMhRZsgJXvomvtFthg4QO7eC4=
X-Gm-Gg: AYBFou1PqcjFbFUYUd819XGbtPMFugx+rWkr/toZbcb0HDvWzMv7hxCb4zueNFFstwy
	VwKrtQt9XLaqiutL6KBhtPcbR7KaL08S74OmbbhefHxN5qx3KS8FY4pDt6Cmnux2OUiEjfStLOR
	r8QP/rUtYLaGesqaa2s4hvaKAY7wkXCMEq/x3OEJv+XXxpuuvaGteLJKZgq3osG+mq9gOBOdiiU
	zw0qqNtYHnr3MXACDM5f7I6D+A2pwCl3oe4JdO1zcJWdVnW50u3VRUlbDVir2evH3S5jB0xyjDd
	Mtq04I0pUTfLrtq2dgT6q2sYl24UxLuCzLSH7hmxjApqq9Jsxtb8wQtKTNEzCJ22FJcm6i+pHBR
	DQW5mcDH2UG+DH+oRdQKwPhwx0CV9TPuyf3+ydJuX6Z8=
X-Received: by 2002:a05:6820:c0cf:20b0:6de:1457:fe27 with SMTP id
 006d021491bc7-6df35751835mr1165830eaf.57.1790929106071; Fri, 02 Oct 2026
 01:18:26 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:25 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:25 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:18:25 -0700
X-Gm-Features: AclHuK-Hi1IDcNwpre_Y6ZHzm2EeLKmSxo_YJvDRvJiQHnzoK8AHz4gyKppJrj4
Message-ID: <CAO7O_xhSjWWn0RfikT5dWxz9s-iuA-quqwpJj=Q=74W0mKAb8w@mail.gmail.com>
Subject: [PATCH v8 11/15] media: ov2740: release group hold after gain write errors
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Digital-gain updates start a register group before writing the red, green
and blue gains. The current error paths return immediately when one of
those writes fails, leaving the group open and never issuing its end and
launch commands. Later control updates can then be accumulated in an
unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Fixes: 84363509c725 ("media: ov2740: use group write for digital gain")
Cc: stable@vger.kernel.org
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index ca33ef30267d..4479666f17f7 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)

 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;

 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct
ov2740 *ov2740, u32 d_gain)

 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;

 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;

 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;

-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);

-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }

 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
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
