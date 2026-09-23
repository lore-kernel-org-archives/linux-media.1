Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B943D233944
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 00:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122479; cv=none; b=A+M7pH3dAASV+ARftFKB1zEox0WXnWp9Jrc4lIziuJHb+rC1OrmtQy0Bmx3KbEgyvjmpfT0x/kme0OdunRxcAWPUilWrMeNxHFf+V00epB7G5LNx7YYwUQ6HL6+V++0v1Sx2MUISigBW+sCezNWRbm9QHuznpB5R+AfIEZA542g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122479; c=relaxed/simple;
	bh=kKxpjMyiHK9lV9OtcBaphCHIS0puTCLcWrgvqpO3mqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGeFYieE/ws1mYWkfEg/WE2RpYL4ea/kQWpNJ/DWwsTnGskOyLVjR0tsV+It20TZHV9njvT8QnUF7fTUk2mUHevtQggbxsyCBg2s4ixH9B1WCca+Lo7EaaE1UMLLkfGWNrk02zLyg9en+tyOvOy5MEAmu4DeIjZ4hA3OzYBZ2e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1jBLwA7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1jBLwA7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so1031515e9.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 17:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122476; x=1790727276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lwakMGT3g+t2lkoiIlXbmB0IFTfs1dS2fNYFlIz4+A=;
        b=M1jBLwA7BqUBWNgeep3mnrL7hq3utgb5eWlkQ1TUK9mVpJUTud4KlxJ/7VcTH1Gndr
         Pdb/icbgeYg9xBYnJsbfy8jfbl8q5hL3TkAbm/VfzX/cGZWZcn2EDk4U8zVPygMxYkl9
         f4rkbPCsQGHKx6ct1tVlticB4XVMw8aewdvJSx0rW2kNYsfsTO4myJUoe6BJAZOaDEXp
         GTT+ENDUqRNBcGhl+r41P9HgUivb3rZLVB2aKvgPgsAK9w2bnU/Ghc6kwVHCKG7efLOx
         ev8z82cYCPFAjE+/mvK585uH/LQg5y1pZ+59Me7e1s06Tqfef8RwxbeOxB6/sbxwZ/fx
         fx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122476; x=1790727276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lwakMGT3g+t2lkoiIlXbmB0IFTfs1dS2fNYFlIz4+A=;
        b=0U7C4Aylk2UAlJ5TFmcJ48W4j1EnoJZouI4XI3cBjCJyZ2s0TzVb6jKXWxvXaisQYi
         5olNuSdqHOIThmSVFu52b3WhnaUZqMez00TmwdnRduZ3ZFImJTz5+BsCS+ruUZ1Zd3tn
         YrBTBjQMCKpoquVg6JDtRVV3gqR1koN3HIuBFKjrn7L9YcoQVPx+stM8VVyQAV6Wx0Eq
         N8diQgVESiDDjfkIUWZBWSxJA7X54sFM3JnBV4oooRKqG6rvlyGOWk0dcfoS9UtbHdCB
         I4XLjsnlaYzH7LhYRrE75faC3EV6scQuswVBd2S0kBxmWcTHEKvJhpqpq/DErM+xHjsh
         R09g==
X-Gm-Message-State: AFuF++ldtz8gsTEaeLZ929j+jSWntdRnt7wSYWmqwIoFTeSrMEVAGX11
	pOboHBiAC1HuLxO0vmiZRimFUFZkx1cl9MsA4skRum1r7+zmX+2Ahf1k
X-Gm-Gg: AYBFou3AKIC+3fivRlsQf17YpMoRmI+7txSGozMQlucEcApwuqgHC8GyY5w9sKcXGSn
	iqXSM4m0sEMMTLbBmPXbZc0ElWJPCsp8l/w7Xz7GYgGICxqaH3/y65NzJYJQTwRkb254TDrwvp1
	5ejH0ZmoitcppLm53AfhgjmYgTrbMNNOSeOUFUsGbtRIJHjvChmT3KEZ9/gha8W10zkoJ0i+rFt
	7kH8C4T+ETF893R/eyG7z6/+00PLFB7B7uR8JbXhRKVXwHO6lxYM7ItHHWr+AxYiS856Ce1dj8I
	H5AHQPjNeyHmIzeiOGfeHIFXhcwttud7/rSbsMe+cbSEz3FNysNZXfyAsEZ2ukgp3F511cMz+Z1
	xyhqNSKcX2sV3vpiPlE3GTbNwARI+TuYXyL1tTBBN3PGRKotmbRgNkBwjCE1qd1K8g8XWSCjCLB
	JdJFXYDR0dEKiUFFfBOsBiEnoHHWOdexaX85Hk43ViLxGdyMYM2Y6aGTUE2/NEYC/AF0p/G0SZB
	XMmkot2fEU0WH0IWaZdtfNRIqmy84tVBddM2GfMr+8seizCtkoOoDK66Whu01T2byFmy45beXgO
	qHVErQiFRkbqGbD8uYBDWmv8lAl3HQ1oeUrrbXk6f4DuAh75xDj+iT74ZEtKPDnUvEuNuOZ9T88
	pLf+tDQadFkgoNTjAGIvcLg==
X-Received: by 2002:a05:600c:6087:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49fde360163mr16064825e9.1.1790122475827;
        Tue, 22 Sep 2026 17:14:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:34 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: [PATCH 2/6] media: az6007: propagate USB errors from I2C transfers
Date: Wed, 23 Sep 2026 02:14:06 +0200
Message-ID: <20260923001410.30297-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
References: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__az6007_read(), __az6007_write() and az6007_i2c_xfer() currently map
usb_control_msg() failures to -EIO. After disconnect, USB reports
-ENODEV, but drxk cannot distinguish a gone device from a transfer
error.

Propagate the error reported by usb_control_msg() instead. Keep short
transfers mapped to -EIO as before.

This lets drxk stop retrying and accessing the device after disconnect.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/usb/dvb-usb-v2/az6007.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/az6007.c b/drivers/media/usb/dvb-usb-v2/az6007.c
index 4ce1afe01c3b..5449ceda87e8 100644
--- a/drivers/media/usb/dvb-usb-v2/az6007.c
+++ b/drivers/media/usb/dvb-usb-v2/az6007.c
@@ -109,7 +109,7 @@ static int __az6007_read(struct usb_device *udev, u8 req, u16 value,
 			      value, index, b, blen, 5000);
 	if (ret < 0) {
 		pr_warn("usb read operation failed. (%d)\n", ret);
-		return -EIO;
+		return ret;
 	}
 
 	if (az6007_xfer_debug) {
@@ -163,7 +163,7 @@ static int __az6007_write(struct usb_device *udev, u8 req, u16 value,
 			      value, index, b, blen, 5000);
 	if (ret != blen) {
 		pr_err("usb write operation failed. (%d)\n", ret);
-		return -EIO;
+		return ret < 0 ? ret : -EIO;
 	}
 
 	return 0;
@@ -782,8 +782,9 @@ static int az6007_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 			if (ret >= len) {
 				for (j = 0; j < len; j++)
 					msgs[i + 1].buf[j] = st->data[j + 5];
-			} else
+			} else if (ret >= 0) {
 				ret = -EIO;
+			}
 			i++;
 		} else if (!(msgs[i].flags & I2C_M_RD)) {
 			/* write bytes */
-- 
2.54.0 (Apple Git-157)

