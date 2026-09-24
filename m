Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA243372ECB
	for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 17:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270345; cv=none; b=NgTz4qb9CGpEczidGsXhpsM17mF3Hrv2/E/cNxoo9v2BMvllCwAb4a3rYHAKYUS/NuEy0Bz7tvI397FIL2j+VD4VrU6/7S+ME7UNQUHLupgCQLjLbSuylDVydyHckAIxEDX3s96S3tXRYDFWrM7EfAl8uPJjALcc/hGgiUOyP8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270345; c=relaxed/simple;
	bh=IzOSQ5PgShuwmISU178ZdszugMpsD5D2m5PTctJO2LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdbZSUceiBDUdnqYCVHBuLN3jgOdtGJ7xTmyWXqqacT1VzQHrypjSbOAdbttR7ESPsrdyGVBPYfXpAya00Qoj75YTAlLFwiFwA4GTRPRJJ6pmfzoK9uC0fqpLpI2ppZHh4K1tEA1+KWvmoIUMAzniSKhoI+THwqTrhzm9q8Zg08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsRpgt3Y; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsRpgt3Y"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff04155bso20369531fa.1
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270341; x=1790875141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEg9sPLG6R2rCCs4MQKovEl/ls6n0s+ptG5DL7CC2NY=;
        b=qsRpgt3YWee5mEfFoEQnNZFe4UJqFMFY1KyWlHPiG7YJZ9bni5KMSfHzx1QmI8aDL5
         rEa7zQwxZuUZZnqYCb8s2RzAwxHuKeULr+1BMMj92D/GhbLBEfcUazgoQdx0PLemZ+m2
         1152v5jUZvtckfwiJ/Gz0zttQZCKJkTWxGu4xHUVJuknX9uea8RRE4oKK/6cpnJlWct6
         tgdtgafhm+Ow2O6XnmN2Qj2DCPnn64Zu1wZS6DwT/sifvBfPsq586/2Ka4UyT6wfTGdS
         ZS8xRvt7TthvNbAYMxhD3Mq9qPHMzq0HYi3tf+FLG6dK+vaOrjyuTKT+1GtG3jyaBEA7
         aYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270341; x=1790875141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IEg9sPLG6R2rCCs4MQKovEl/ls6n0s+ptG5DL7CC2NY=;
        b=BUK8wMDlBm4otKNSAUoCJxmUD6Z1JNWeB0U25L5rnM1PRqYaedDIPR8pfC9n31lSjn
         ShKEYG/97+StKRcSst+jJRaoRclnnF8v3gEIS9ybiLkW7TjrsXGroZAoWvq74jJK/2sR
         SHMqmJS8wRf9A9P9ILGS9fxmm5MaEmI+sUYy+Iwz4X9fqhA7w0kgMYjwSpr8ykh7CSRY
         +OALoCp8x76EVEJwJ/1GoizYJEOSRgm8XKYmIy4wcK9x2OO6gxg8a4q3hgttjcIZiT1G
         6A6e8z36c3UUXyD1tJyrTUcpkhu8M4gZcQQC9Aq8TgYmP/pyTWhl2wUwu5gQ4AgzZACh
         tklQ==
X-Forwarded-Encrypted: i=1; AKwUvBwugA6lxPyIGm9V6rwUP0rZTipNnJW3dU0Yq2++CeX49HkGXgqVfIwX2nYef0m5oq0dmNNTRthraQivVA==@vger.kernel.org
X-Gm-Message-State: AFuF++lr6lt1fBTwCgLux9XISbQ9rmdbR0EtqLFxgj7afYEL7x0ft2eY
	poLhnkYy2qx1TJl4rfc3BbTg2j24MyLBeZ5BohatpjjXIDIW/4dqpGxz
X-Gm-Gg: AYBFou1aaKIn+sINcCqTZn7+ATg+o3VhPHK5JNFnkXQjIKJ8vdmaXcy5sy5WiUNOB1J
	HK2d2Kfm8/MIu5gwJVLPN5Q5XNssczij1rgOjcBcCrOVUJgIghBEXy0sBC2UqOX9Rw/NiFc8mi1
	gQI5nb8B1RavX+juoLst/44YQycaWLpkCA3OBwqcIsXldPga/Lk+nSwb9huoEtjx2HfojLcDxYu
	0KH0Wr+W9fMc2H82kFSZDRRKx36WkBFrsxAYqHzg0pn0CjFDuNObPQ2ZCT+YBzyDs5jMnhmV0vt
	9rc8FIIKu/JCr79PvIwpuveyvCYoXkEJgb9wdi41SxE1efUG/1XbbfDAUvYBJlpapuhMLw0HQPo
	ICHb792msztYj85CwUlYKsUCdAzXdAAfG18XQ9mFOcuTn5AID3zGcmewl8nphsCOgsv8uOTPUPr
	oWZ0TZqeJRU+GQC1MECmtx0tPY03BP2sKEBNHaO2wqWHdYxF0C9xjcZ63wdJC/bIyQg2g2LAMdJ
	7UyrzsSTVi/dIQ=
X-Received: by 2002:a05:651c:b0f:b0:3a1:f4e7:a820 with SMTP id 38308e7fff4ca-3a63bf292bfmr8906191fa.4.1790270340690;
        Thu, 24 Sep 2026 10:19:00 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:19:00 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 1/4] platform/x86: int3472: Map the VD55G1 power enable GPIO to "vana"
Date: Thu, 24 Sep 2026 20:18:17 +0300
Message-ID: <20260924171820.1179823-2-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924171820.1179823-1-koreev.r@gmail.com>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo ThinkPad X1 Carbon Gen 14 has an ST VD55G1 IR camera, ACPI
HID TBE20A1, behind an INT3472 discrete device that provides a power
enable GPIO, a reset GPIO and a privacy LED. The vd55g1 driver names its
analog supply "vana", so map the power enable regulator to that name, as
is already done for the imx471 on the same laptop.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/platform/x86/intel/int3472/discrete.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 6c729fcfc..d005595ba 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -130,6 +130,7 @@ skl_int3472_gpiod_get_from_temp_lookup(struct int3472_discrete_device *int3472,
 static const char * const power_enable_hids_vana[] = {
 	"SONY471A", /* imx471 on Lenovo X9-14 and X9-15 */
 	"TBE20A0", /* imx471 on Lenovo X1 Carbon G14 */
+	"TBE20A1", /* vd55g1 on Lenovo X1 Carbon G14 */
 	NULL
 };
 
-- 
2.55.0

