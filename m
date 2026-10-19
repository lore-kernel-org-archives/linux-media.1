Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F9A573F13
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420117; cv=none; b=AELjuV25W3rG/6XoCabpFEGq0BrNulheKVl/ZjwtzMpTbgm+dTyDG5mfEYZC0lEKUNGBW8HARn3FUXoMH8sg3sCII1beO+NVqv4WfS6hvcKhDmtKh/gb3/VYV2i5OFPB8D2RrJWzgbPIPuE69KF312VsW/B3EJPBLbGmgLmXtl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420117; c=relaxed/simple;
	bh=Dlp9dvCWyvLZX07fGEIkpoh4ovrZtz1G7eMIL8kOvVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1eWUVhpJSLY5Sx9N55sROylky8onkIavifWUr86lq7/UJdXTbGc9n7rOMnyGl0hf2fG8XKIUu4IUNOBJ1RXzKTeerW/ImNfr2fz2OF1Q9WSyBZkDChjsPw7D4x75Kqi6Er5bcu4hdwnlTG+rBW/TxcQnqwJ0rYRZT4nHXXtJxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=dCgK8EAW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="dCgK8EAW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2109206f8f.0
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792420113; x=1793024913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=982z15BDKZb0isJxEAdL4PwLsO3TFCY/PrvmYCW7d78=;
        b=dCgK8EAW5WLK5QZBGNhvHjrUciwJWKp/RvJyzOH0Jnrdfs4MSxGYvivPt5P/rBve1I
         a1rKwaC5S6FQdRiv+fjZp9NuyCQrJIPpNuPvbtB9uleM9kScA5+RIllQ+/hwp96YK4Zr
         rj1nAVFcHdO/UCRF53uFFSSVvnKQz5ONEQ35OhlJjBAYYRvH/ir8MlmoVuxe+vqw6Y0u
         8ABGw8texoIHB0yOGPj/fdDiXoc3A0lwUZtIgd0Zu6IYt2kLzHaoGbQWCVp6eI3dDEhB
         M3lz8pBizC9sVFa5jk4z/LdTalD0fcpBSzwgGlvpCWGoCHsmribnrD3femyXHM5eACSr
         PLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420113; x=1793024913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=982z15BDKZb0isJxEAdL4PwLsO3TFCY/PrvmYCW7d78=;
        b=OR3/cRjFg1NG1udScUyK0e8aFvYa9gn3CGbQuJsrLu7G1vZHWyVDW4JfiJ1W/h4nGd
         AeHQt3mzcSMNwdX6cc6PK89NkLx8+xBBlOjL3axjlk5UH7seVew7U00ygcubXdYN3z60
         624lmdZ5xjU5/SD0+79J4BezGAft5Loo266XVCSF1yVzWe6C3IH15aHAdpFgOfVCtYFW
         ljchjWc8DBWQmG450aIhnZcvGEH8CXqj6K3yf4cvlFmTmiWfGaS6SnH7j6/7KCjUImm9
         aYYydWxhnTx5UxUa+j6KfRm7B3v0D3Uakhqao9hQFDj4lRk3cEAwFOqa3AtTExJlLuNA
         QYPg==
X-Forwarded-Encrypted: i=1; AKwUvBxMYAJTuKeZYWkkkmYw5K9WY6I+WQOrvQLxErDM2S6zHJauLFq53pyG0zteRqB8ZmjW6GZ1Y/kJtvmw9g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJKTVLOtySAJaI4/fKaj0c3GUqBDFKVcb+LeQ+n67DMCPqRk5nj
	RwzUn2gXu5pJFeA/a9ESjUw6YZy6M4KEmr+HrWo7NP6DRhoLmub9jbD+1s7HXKrLoSA=
X-Gm-Gg: AYBFou1VZnf72KPEAj48mivK6P66tS3vIQ2Lw3fsP5et0wQRtPZys3f0rF4tpjzl+yb
	ha7FS1y4cGt8/VeWGZxN9eTfWmg4v04pURJyL7DjZvCDh5LEj4a/zrn3oa6Sg1diB/P9zaDBbIr
	l74N9aH6gJtaERsLx5qZPTNQ9ojIxB7zomxJVE51N8qvAaM/cJB4MmzAJMcfjRWEjW6QHdkKxAL
	m+nwr2UvzE9i0vH+hLmM+7BZlhzDRYQzBBW1PL/303PDAH9xGni5Za4hoRVyAizsSEEG9+hpk06
	hKl+3/mF4kNFzlvtxnmo4kv0IVKcDPtacQ61jxp+8+yObBfJrWvDo5BJVyviXVC54aZrnUVsHsx
	b9DjAzWZwO4l3bwsDPn7sYwbHA951O+ZQqJE7On0fpDuT3U/xILyJzwsR3hfcY1wcuUCCBMitYw
	H3GgB73Nc8/g5RmR+eIqZb7M0zSZL8jVzr4H8/9sS6hVhO+W8eUa3HZRRbybew5PgsXAQkpMJwP
	vlWdahW411W4oKB1dzXl0edCWfRIava+GxRf5tb5DckO1wySQW5s1RkBy9n
X-Received: by 2002:adf:fe04:0:b0:48d:f1ab:faf9 with SMTP id ffacd0b85a97d-48e07bbe7cemr12107769f8f.16.1792420113202;
        Mon, 19 Oct 2026 07:28:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm23854576f8f.2.2026.10.19.07.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:28:32 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 19 Oct 2026 15:28:16 +0100
Subject: [PATCH v5 09/16] media: sony-starvis2: Use pm_runtime_autosuspend
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-media-starvis2-v5-9-eef935347ce9@raspberrypi.com>
References: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
In-Reply-To: <20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

In order to reduce the time in stopping and restarting
streaming, use pm_runtime_autosuspend so the sensor
isn't powered down.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 2388105b6a30..bf14768dbf98 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -858,7 +858,7 @@ static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	}
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1047,7 +1047,7 @@ static int starvis2_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1070,7 +1070,7 @@ static int starvis2_disable_streams(struct v4l2_subdev *sd,
 
 	__v4l2_ctrl_grab(starvis2->link_freq, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1448,6 +1448,8 @@ static int starvis2_probe(struct i2c_client *client)
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	ret = starvis2_init_controls(starvis2);
 	if (ret)
@@ -1495,6 +1497,7 @@ static int starvis2_probe(struct i2c_client *client)
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 
 error_power_off:
 	starvis2_power_off(&client->dev);
@@ -1516,6 +1519,7 @@ static void starvis2_remove(struct i2c_client *client)
 	if (!pm_runtime_status_suspended(&client->dev))
 		starvis2_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
+	pm_runtime_dont_use_autosuspend(&client->dev);
 }
 
 static const struct dev_pm_ops starvis2_pm_ops = {

-- 
2.34.1

