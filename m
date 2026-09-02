Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CE14A485A
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360834; cv=none; b=HTu1joufEvX0Zr4AfYFxhJkoy/QNOwptk+qDlRcJH0bp9SilSr4Tkg7CrcxM8fTUHZoKWKfZ9AKEH+5NYDV05bc1KJWN3CLyHMuWxMlU1D8TlP3mS62r/Hy1iWtdb/B8LgW2djKoadjAlVkM9NBor2PwFSoSta93ehrWXgmK5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360834; c=relaxed/simple;
	bh=IJTIjXefCtpyzFz642pELl2c8LGlNjVMmQXZPOjQ1EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgD4b/TPzwxjfV8kI7q/oZvCsSn1ORqNpjhvyWT2kW/X/4tVu385pFlPrSKwY6FmzGiblMoYAEVDsNqMQsKp1gHpNQgViPjKn70HWF6tueYSEE3Bh/lDxAZnm4aQITUWdF/OzPPyLwKS1FE5fom2yXmWoTnulD5Ems/K58Cynlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kjn15Bj2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kjn15Bj2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47de0093c42so1270711f8f.3
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2026 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360831; x=1788965631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=Kjn15Bj2yjumPTs6N6HCBlkrhqdHV9BZ01hLSpsgGL9jYTnT9PpSm5+ny3IBhlTUYs
         qzZNEZSM5Q45LaORuu2RXT4Tl8bbhpo2VyICKDkA7jBcyd8395qQ+p96OnBw3ydGFn5t
         iYxyaFMK1+iI0Me6RDQFLevTqOvqhmxEpC44GWgV78v5/MP423st+76P+0Q+lSDdhDVb
         Lkn87VMdzMuMvDaZYm5mJd57kJ6V6loBUU/vNfzTNfQf2T9pV0x/xYj8wzSsZe3EEEzA
         4mCfPZY48UbCzA4jZm5uCBowpHwPOdcehROpK68lyLcsDLRc4xs861awD+zMJORr70/8
         H/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360831; x=1788965631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=XfDB5+88DUhZph4gzgyvcZimheDR1bQqN3LdfDAw56UkN27V4YBwDFU+yu++VAY9Zu
         5kqyUXrCbVJ0YQDZFnovmkRwp9FbdJuQQn4iLFrbkhvqqVYHu5b077qYIn3eTb4mfLyv
         Zv4SC6DYLbu2sRdvSOx6bB0ysEVN0KSI4ajfrPb/kG0wOqVKe3TOWIsovuZrbWg9KByn
         pgCfjowZ+MD3LjXq6h1bjpzdRcoSM371/46bqtkkrpAgDFp5wbcL2TIYIc+zKqHlVok6
         e1WhT5+zYW/fu+MS/mtDCOPrLkMnk2J0T3hgbuWdFBPBliTrxoaTZLeGpJ6RHfDYvKGT
         upZw==
X-Forwarded-Encrypted: i=1; AKwUvByOOy+ay9bRGEXUl0zbJdfu3XHoll0nF0sQQFNuuySmngGRvFOSArcG4AKCT5LoaK1uwqByTwjXfs/RNw==@vger.kernel.org
X-Gm-Message-State: AFuF++midqb0hYnIskAIOUSIF+A9AbLw5C1q8y5y0NKGTrxXpEcUyPSv
	PNRdGRNhaR9XLCG7KUFSERn9NsW/yWZnnrGMNm0pXBa1mVThJG8IQR9a
X-Gm-Gg: AYBFou3Oa7PtLWJQvxcmEvhMGd1/1gqpWaHY6S28xDZzTX3jbzu1Lmlwd3hQ4ujQb3X
	ex2JPjM3VP+bEQv/JjDEXg1DTHirMHanX/2cu6jGgbIFGh9noIs6nl0+R51/wlgEuX6Gyipzk7F
	Ix3Tw3BJaM0WsGyVVttXIn0DdWmp3zHSVlOSe+VtYQ+cfQcGHYs2ChoYlaJiciAzsF8BfUpXJps
	IDuFIWR9Tcd/lNSjbi/JZJmeHmBuCGo2/1RTEYT3DlBRwsjZRHiOhbtbtw6EjeLXw6E1U0gb8a0
	0kh1lgnMCIaLStQ4Fjllg99lrupEOvImnYEt6kOsMwzAkfLDbV3a7tWqMKxv0NlKwR/Hfp8BJpp
	2l35pzQTS13+Le1KsEQC4+nbfDw50Euf/ywHoZjzex8XeR0l0Rih2jbLfFg4XTSQICs6141risP
	HnF03jlAnTN1Oe0Ud+2M4gXFXs6UlsPH5eUj+e+H6+mXdgk62PdozAcw2DlB4fXmbvxfCfv0Dg5
	aErV7Yk0UrRGcKEa4qV7z2wXgPGtu+VNOFotdCJyctk
X-Received: by 2002:a05:6000:2211:b0:484:3c87:dc91 with SMTP id ffacd0b85a97d-484913c33bdmr9871534f8f.19.1788360830513;
        Wed, 02 Sep 2026 07:53:50 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:50 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/16] media: ov8858: Extract digital gain programming
Date: Wed,  2 Sep 2026 16:53:30 +0200
Message-ID: <517c4f11075debaaa3eebc4e8bed574ac832565c.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 3f45f7fab833..d95f034de752 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1523,6 +1523,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
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
@@ -1531,7 +1548,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1570,17 +1586,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
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

