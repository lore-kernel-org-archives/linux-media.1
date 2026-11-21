Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233348;
	b=fCf3OzjKgbf0FrsZyLY0lHJ7U8M8d35bztuKjWcSUpSZ80UUipSr3eJ/BggIEwT3IB3B
	 PSQVT9okBtQb2VsFVoBuwHHeTMGU8+d6AyMC2R201Ei6OtVHLfohZnhZ/+p0Bm9e+jLqV
	 kCAHMzs1t3cztuk+el8Rsr7HUaol969gg2yruEWjhPndzssRmYKkp8MuRpxi+hQz23ztN
	 vIkJfmTJv0v+7lxs69JLB6IyWNK1V1wEFKxfpq3MJCZzbaAaOHw4oQkX9LR4Li+Ua5aVo
	 vkh7bHrWx37ezcCuQTK/C35y5Ojat0IYl4rYBKbuhByCcVmVSGz+rFUTiv+hc2Q6fKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
	b=ytScWGl3V1CS6iOjS/6Fo0MBvuvIeVQ1GPTrHl+uWu+20zCJT8LvqzkXKQJfQi91rDDR
	 WZqnVu42+FNceFWRuIA8dXn5KsroIH6d6EbRog8cbG4J2jLIM6P1MoayJDIo0OMNAr8nc
	 vfqJZDxZ6ukIsPBH4QWVO4BH9cBDkpshzxmTw9hG5zKsXkFXRGXZEbcu+YK/7tfmJcEsJ
	 sQ/uz/2u4se7+H7Q2iGOYbuULy/HS6X0vR5srXCZhs2D88m2oMJY1zoGjH2GZ7eBrqLhO
	 oJrOuVDWux6arJiKJMKVg7D1MQB1yZ3u2W/hI1tkjTImwUbd91wzEq35BMVa1/FyA7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPalnPgr;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3105606A6A0
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 03:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3105606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPalnPgr
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-717080a2d50so1455216eaf.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233345; x=1795838145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
        b=YPalnPgrFTJrmqQNuFZXEBMnkOL5fJganovUfgw37I6U3eVfJfSu/EJMW/r/ptkiWM
         JuKw8XBwwJ4JmieONT28MymFBceHvD8Jvpgm8OVg86vSwned/LBLsJ0B+Po1f5niK7Ed
         AJNNK616YS6oRg/UzEYFk2QTRyWFPsCy6kKFxwcD9PfUJNKQt29vkGuTQSwf25SPYRD0
         NI4wOv1nAx/xK10+DVjX17/NRB/g+6VxudPsBQ4u0MNyeK2hkqCMNfPHSfQ8OoiYn4q2
         n3OOnqOtklVALiFuE6lPeBvnSBqvROTMq8u/pm0nxW6xfIv2QOTUuh5z3CJLE/gQ9XUq
         oA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233345; x=1795838145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4zJLU7TV4OK6TSVsIiKHn0bV6zmnjofg1PwBOjuNmRA=;
        b=VwSIeiEQaGLeGrF4sek85SWRw5+ScJJSg8Hb9r7diYD/bO1QDlHh5ilJjFzaFieXMY
         ed72NbA3YnyAsfVkphbssFOxFzLfb9c82h6YqP99v7QYEDl0z4QyUlnif3NtyjEQZ4ts
         cel1AvMYsf+BAGcecC3NX53UNkNtvmcAAPnZiz7WE37zaxqcQpqaDMQZARqYEmPYl5gE
         2y5cZ7pwk+mPmBDfFviv4NDQkCwRL3kyNCihIE0uS68hNfHPCn/puaBBHeG/NRrxvx8Z
         ji2JuBPepEZq8k8EGmjCSi/6DV+7HhT+164GH6PUvk1EXt0nX8ioGoeQ5cjfn2PApG1P
         BDAg==
X-Forwarded-Encrypted: i=1; AL+hErENQx2gRWKFHT0eWkDQAewECRQmtYiWIiELqXkPDBX8atartkhbQhXDbdSzaum47KpF2uxSlHZ3VddzOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/hycxDAurSkEq5J9dWXlzUok5DClbeJo4kbOkUQEy4Bc6Qlpsa
	AegwgrWzf+/ay0IlbFhBQhU6GO6sbtYQ1LpSnSrNFz3FdpL052HJAGs=
X-Gm-Gg: AYBFou1jW1hvmgjBlNweID/Q2k7c/esxJ8Ah8zsW5h1Rx5u1KbCApqi6vNXqVEFpYAG
	OmZ68UXpY8lp2C6euVcg68gXmEme5U+6m8LrSewyDvv1ANhmuN9UmjtyWlgf0ukR26fuHFkI4uU
	jvm5ncc+j9Tdzk0tDNKinUlJ1RmYyXJk7FA3I7I2kKeLpsCO4rH2FpRoBWgRZ0X9Q5Plgi80IVe
	AlV5AUhMKP7iNT6O9yuUirjBdW3EW52jZRYR3HYducNj2MM/7jox1B86rd+G6rrZopxPjBbdqHR
	lHSEDzRa/ahp1Z1YbsA0JaG+/DhXnU0QwjhkeReTxXB6q71MeKa5LbJzwnRPJmoJEMxnvrD7cX2
	/BM6/QgIqfvPk9U4a08MVWFclpSlydDk87HE901ob4JQpg1aSwyZiQV1dfV4Fsr5+PFxH/iD0Fa
	ey7KgdWFKbLD9JkurNtsJzjs6nHYtACsU6PG02xWMVRQYYlm9NVHbv4vXl6N9OG70WJsKm5zoAU
	wZQPidF7mXS8zBRpfphwRqHP0CpT9f3WZ135WiJbDwIvvVkDFO6kxNkMrgjs+JfKby3kmCAjWJj
	P18ByLwUFM851yiSpDh6OTY7p6rDEDrxqKUu5EajhCG1UYblYmKo4X+6
X-Received: by 2002:a05:6820:c5d0:20b0:71a:f794:49b5 with SMTP id 006d021491bc7-71b395c1759mr2894179eaf.89.1795233344780;
        Fri, 20 Nov 2026 19:55:44 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:43 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 02/12] media: tw9900: release the device when stopping the stream fails
Date: Fri, 20 Nov 2026 21:55:13 -0600
Message-ID: <20261121035523.26764-3-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If writing the register to stop streaming fails, the error path dropped
the runtime PM reference but left tw9900->streaming set. Then, s_stream(0)
again would drop the reference again and unbalance the usage count. At
that point any s_stream() is ignored because the driver thinks it's
streaming. Always clear the streaming state and drop the reference, and
only report the error.

Fixes: 918b14a26b12 ("media: i2c: Introduce a driver for the Techwell TW9900 decoder")
Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e07924faa84b..e9d384039b50 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -303,14 +303,14 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 		ret = tw9900_write_reg(client, TW9900_REG_OUT_FMT_CTL,
 				       TW9900_REG_OUT_FMT_CTL_STANDBY);
-		if (ret)
-			goto err_unlock;
 
 		tw9900->streaming = on;
 
 		mutex_unlock(&tw9900->mutex);
 
 		pm_runtime_put(&client->dev);
+
+		return ret;
 	}
 
 	return 0;
-- 
2.47.3

