Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B226945C6FB
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930156; cv=pass; b=kyc7Pl0jjF8o3euyLAxcCyc0C4VFOrXsnAVSsqElLQLiL7s8CLhfzdY5+zJQEFE8FpUDugbwAvK6lC4v8muotYcyxFroQOs91O1hLmaUkZpdJ0kG4KZSlfl582t/L6E91Af0qMZ42PjV2TE6GlraNmVgT6mUoeiTLBnOdhwfkk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930156; c=relaxed/simple;
	bh=5Lf40F4jqAJa6SoZeleXwYqCtcr/IFf80+LzR5G4iws=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRiJlskfQasjxX8jTMS+6s2wRH0gXL41wx6YUl/GidcqqbG9oGDnllziYw9tYjk5fmRBWWxVBWGT6y/McGfBIv9UdfXbdK2HCFl30OWxyWRgaemOUXX4B7hz7lOvvQKQZ/reVRHKI9zTj1CZmJX/X2KLNYhcdi4AqmUQmjIlhBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srWGdLe8; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srWGdLe8"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6d7a52c9d62so2845170eaf.1
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:35:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790930152; cv=none;
        d=google.com; s=arc-20260327;
        b=i8lFiIrON5g9gggY33Iip4nee3qAIOjx6ABOkJfB1PNddndpTjIBGsHPg7F2TCNKv1
         xtoZYzaFLGTzEN9FLtx4u5219HN9eYVoZxllfgBauBVK7FYTJFWupFZbH+fWeUBItm3W
         pxBAHRisfKnK8R+pGXdIthkY3giTM9mCnFBPmcS/jt1DNB2eeID8+h2i/6cU8IwaV8GJ
         6+tuuPUJfu4Bv0qekB4zUnKrZ33ctNi8Dli82vXRBtkTgscliparWPjVYNyvz6pJiQ8V
         /4OsEmwKveRnZNSBeu8ChchVKazW0Wsn+I3/wUWydi9Z4ewXolexWq4eckx8qLu3rSn5
         aHsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=ixm9wnTRw/IMUlrBZgFwX0kWno7rJE4TeERGvWa7BZE=;
        fh=zfH2ctP8hk0YPMkCwHBlIXlGCDNBigNaRm4k2uLDIdo=;
        b=DtjlM/yLEm/2QyfjUP0XQ7uiNm4jstVPzVd2SqjGwLi4SzEL+l8MJ753o1Tnny6Yu3
         x2LN+LzSNoAtCvrCZVbsKpXnlcCHaErgNUVJu2WTSis5mVhqtNLvKW4U9MnO40/i4TR9
         35rmF3tgTKiRyTpOni3Ha3BXbfKg3wFAL8WSdafKojYmzugHf2UqsatbMzTJZbUjOUZB
         TvuxwPcdum/wF5LavwDQNk4GwSHA07rXtncpBF9u12lxI+yGzr4CMEZ7lNEOq3e56ayE
         QFV+iy5IzMcDLOhHiwFFV4w1M+vwtyICKQeks8ugEtdd2zQYhwYeCJSltrfBnYuSTSjI
         3uVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790930152; x=1791534952; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixm9wnTRw/IMUlrBZgFwX0kWno7rJE4TeERGvWa7BZE=;
        b=srWGdLe8DMvzEXcW+sGIzUsf/fXdWLeKirPDmgX+Jl8+beCPrqZNtTacEVmd/rScqt
         JYTROg4F5J/o9Jo0erowSaqyxTgbBnEf5W2JBwm1MlA74Pmb8DeXj4YW4Nq8LbMmk90D
         DR9RQaKl0988QBo7Hj7HvYnl/M+rO+GTtBKtj3bPttZUOut4wQDXbxFgZn5ho01/Fp60
         f3Mk+x/F73cUUpJfZ7kYJYy4Rh/jHWAihZIvuD3u8PCyB9Ut0yfZELrDbTeLv0De+wmF
         MO2WrKz4ykj62tGH5eX5Fj/L+qQR1D9lDL4+KFnh6bpfyo3tba/SrhvP65AXfePaLhcg
         IEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930152; x=1791534952;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixm9wnTRw/IMUlrBZgFwX0kWno7rJE4TeERGvWa7BZE=;
        b=EhWW0XMrWmSAswlDc0bMoWS0eg7W/kc7Bpe1/nMfta8Y8Wohrw/b2ZdXIRfMuvd1DN
         1S+mUCbBDZUd296hg5oYh4tvB9Elv5S1TEpxtVRK66An00S0Qxwrtk66I8zpvQDuI6Nc
         87tNz0EUa+tyOHptvoeQyhs5bTUIPv1oJgGZcoHAXD2JSrqZd2nF2by3BTxi7jTrfE1Z
         v1F/HJvYoN3o/fzsI6mdbkCnNiLzPnpnS78Irfo0jJbV4RHf2JsI2KYYvnbJIi3TpKaF
         RhdBJRS4fIi3WpNTFmQCKQ4uPcfOvSQZi+pWdmd+vCLZnBHUKZg35lsfNiZejxMLvySF
         /pag==
X-Forwarded-Encrypted: i=1; AKwUvBwCsJLNPfDtgANv/OpGG9s/L5F/IaavyrqivhJ8cDPzburgQjDV6z5XSNWQwoy9AClyC0NKRqspFEqbiA==@vger.kernel.org
X-Gm-Message-State: AFuF++n+RAtYriMcwlUVBCVK8LWdalRpG7LIPeXOY+fdxpN0LjqE1byw
	rCNLiHShYdiXdnXROD+GX/oOaKWbyS9SrOdCR+I+NBlDAAJFBd4YK7Acgp5V1YeY9HoU2N7n9P6
	eDZpGoaME0FvPGOibi7qxqsASJVwWUMo=
X-Gm-Gg: AYBFou0m5M1qqBp2HP4oQZSc9LTxm2PRd66L+xogrvMNzn9NRbisZE6nxG6PTnlGDtA
	9pu91vG406ZFoUSp5yi5AeX/cwJSerO+VDK8JRmFVfeNMe+x/MtfhCeyTXzyYtTkJe+WAfbbJpZ
	2qYQbVjaM0xUbKtixpEBUOpOf/Z2y0YfJEbDb6Ku/i0EXrGJx+bsa7/stqA6kT2BXx6RCkMxnNk
	GpvEKlpfEZ8y6/5I/rgbAl3SgDXLluZRDXf6b+ztRXwdW/WCJ9kTVrHbo6qsOTkeTIbuOtqYono
	rJpP9jNxRHUsqqRIC9dOjvIkuKP/aE5oU6UQXn+b/zEFRHWVgzUuQ2fk41OTk3NbfGEoKxgZBV6
	IeVfr/0AhIRsZPP4+cqzbP5vAVXCWyANRuQ==
X-Received: by 2002:a05:6820:310a:b0:6dd:6d12:22f7 with SMTP id
 006d021491bc7-6df2f405237mr1797235eaf.11.1790930152541; Fri, 02 Oct 2026
 01:35:52 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:52 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:35:43 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 2 Oct 2026 01:35:33 -0700
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
In-Reply-To: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
References: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:35:52 -0700
X-Gm-Features: AclHuK_Rcda0jD4_EFdo0LBQrOhCju3jgDj291uhH9JjAg7Gq4FtplduwTl4fRU
Message-ID: <CAO7O_xjv==E+tOwY90AKpKkbLbbUBtaNmiW2MzERewb+8XtDkw@mail.gmail.com>
Subject: [PATCH v9 01/15] media: ov8858: Extract digital gain programming
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
