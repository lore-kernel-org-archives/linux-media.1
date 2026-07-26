Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882D0221FD4
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785070496; cv=none; b=k5BSXOHI6xs88HmpSwXkZPbro8NtzbNJ7s3t0FsFqeg4qjnHyQZJ1Jl4Tj8jeglqezJ+AdlfxioyOwvFNO5AjItQA0iOrOvp3O3hsPq0jtPV7l5s69ImxNqiLo4M3HzaINznT8maDKFdMgEL0KrpTE1mvbuIIAKhKoQjxBgtNzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785070496; c=relaxed/simple;
	bh=taU9jya5z1CYVaSZqATUxNhPmhV/VodTSEjVYsdJ4ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tGxrT5w6AhbWtLfLXy0T/NuMG054Yrej8IMtemn5kI5o+4zkXoV4sSHJGlQEQSwgMDg+Lgt+8DJmm7Wewe9N9EErmnFdf3P1SOmE/8sjJC1LjqzOSqOFePjvSR6o/ouDLjYlb7MREGtLCUbQhhnLyjjFiTk7lT6jTC0JLXYyu14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzt7hBlX; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzt7hBlX"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c83acb86eso15990031fa.1
        for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785070492; x=1785675292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QfnUxGMQYoQ7V1Nu1lZplk3MivTLe57QIBbIfYAMKxE=;
        b=dzt7hBlXBGti2ZEmrevu9IbQw4bMRJU557qnF7AJfVsWCj3rP6f7G8YaZ981NnoWMD
         lCuyxMZdUOKU/iNPfeOnAutXg8t67vL6lt/HJpg/hPq68m91GmfIIDHSkgEGVW0K+t24
         fQppe0y484kAGN267bZ9XwnLjNZy0qCyb4NdX6PfEEV8DlSnc6RVe5eJhkb2mdmvFIg1
         53wy+91I9DqHmWAep7g9nptyqRykD0UC1EF/GzN25EmKve1iom9sdOST9UbPw+7m+gEG
         s2vbPDnaG+9J6xuePHVoRrDxHioXXHocmTXRqtXyuTPMjDQlqWm+CDOPxbgYOGaS8pq8
         QBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785070492; x=1785675292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QfnUxGMQYoQ7V1Nu1lZplk3MivTLe57QIBbIfYAMKxE=;
        b=dhFoOwXC01Ai1AXfJKg/eBqiwy8LidC/haz2JUT/bJvBG7riagPZRGZgeCQFpz2ZYn
         tuhEujPT3ty5Anb/a5Ig6L2JToqz/+KK5qR8KhC0zR0wXyy48uu0NHwZj668rRwSZKXq
         6/sXPJKxV/ddjnpclg73+ewbKLH1gnm85dmOgWRj6Rq+5czftjomVGiYft8f94lh0hUs
         boS9/fWaQnO552WN3EQ7S3EUnoyeZVL5jzUDe1N7jWOdVN7sqy4pZmZycQ+X6OlTGzm0
         qOWvJ4N9HKIv0LGH1ySVBr9CGTCtmNNW0CKPvYjbturDMhAeao0NL0RTK0eeB8J48SBH
         zfrg==
X-Forwarded-Encrypted: i=1; AHgh+RrSD95mgllLUVfDPmxFKluoqwo6q0u7yUhf/Jt6oC/tbHhsqnagjqI11WzmRnZ7n2H+CZ26vYzr8B+oMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC7PPfr1mwLi2BdOj6m6OYT0R8/zouK70AHtnCJLz2a2WoLAyg
	yNFdBbd5LWUilK3t/lgYTPbXgowCt4/RfYWILGX2gBhgww+YQaQOISgF
X-Gm-Gg: AR+sD13+/kussQO84SNGzohf9Qkbj9b5Zrr1jfmr73I35jg8xVGjigg2bJagbMcYG6b
	JLUphsMFYE8It89/qUKLiQCvgnLuAHsNUGTtayr+/agoHTZ3WPZKfbQRyrOHAyuZUQQDcud9A75
	DVbFvi4ZBIa82NXFN70Fii0LNkj0c5M1ijk44YBwFH7OWhQCO5r6eShhoXihqbPvUV+I47CCWiP
	COkeJONNmIacDdDMLmHh8axrZIHLJXA81eG6Ko0xmaiY3jGrhkktStFceIy6XBsRpagZANkF9cK
	QrC0jufQs+i1McUGbFXoog+wbWzecJGNt3SAeg01vAOEc29FGJAZxMRmCiE3xxnFFmlVtdMfZGB
	AI7fgBZabogUPimRggwmPu5vccToL45LAJ5Vu7EzNNcbY+FyioBf8g7CJHeBQ4TVao+WoLQ1Hxg
	NZA00TIXotYx+c8ENlg8bbWo1zETPItZU=
X-Received: by 2002:a05:651c:b0d:b0:39a:eb5a:d78f with SMTP id 38308e7fff4ca-39f288e992dmr9534841fa.35.1785070491907;
        Sun, 26 Jul 2026 05:54:51 -0700 (PDT)
Received: from archlinux ([85.93.1.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f2224c825sm8104441fa.35.2026.07.26.05.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 05:54:50 -0700 (PDT)
From: Mihail Antsev <mihail.antcev@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Mihail Antsev <mihail.antcev@gmail.com>
Subject: [PATCH] media: ipu-bridge: Add upside-down sensor DMI quirk for Samsung Galaxy Book5 Pro 360
Date: Sun, 26 Jul 2026 14:54:48 +0200
Message-ID: <20260726125448.11723-1-mihail.antcev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Samsung Galaxy Book5 Pro 360 (960QHA) has an upside-down mounted
OV02E10 sensor. The 180 degree rotation is reported in neither the SSDB
nor the _PLD for the sensor (both report a rotation of 0 degrees), so
the image is rendered upside-down in userspace.

Add a DMI quirk entry for this laptop so that the sensor fwnode gets a
"rotation" property of 180 and userspace (e.g. libcamera) can
compensate.

Tested on the Galaxy Book5 Pro 360: with the sensor reporting
V4L2_CID_CAMERA_SENSOR_ROTATION = 180 (verified with an equivalent
local sensor-driver quirk), libcamera renders the image upright.

Signed-off-by: Mihail Antsev <mihail.antcev@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 42a309e72..20cb133de 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -182,6 +182,14 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 		},
 		.driver_data = "SONY471A",
 	},
+	{
+		/* Samsung Galaxy Book5 Pro 360 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "960QHA"),
+		},
+		.driver_data = "OVTI02E1",
+	},
 	{} /* Terminating entry */
 };
 

base-commit: a52e6f7923c17a672135b485ffd96fbd72f46267
-- 
2.55.0

