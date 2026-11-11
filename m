Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405239;
	b=3VjeOuSOrLbRRlkH+8gr5JlIJrTLSGoqewoDJByXr742fqEASQ/JdPUHs5Qdg/NCttHm
	 yX7PP61noei7HBgQcAu2pEHfVtSXBXZ2Tk+IdnPq0WwvrxkpoO8GnR964N1SuOuig89dj
	 yft754FmCOkFIo9lq3zlMLVd+8kaXRebLSEBnUoEZMKSQ/YSjmytul9yk6tpy6WSWpflm
	 3FMNgG/9PpAXwFn7lYYzHsLdtBTJgJ7ySeprDnO6mAdJGnZ1Hztn380RCo2IqnPiby0kM
	 BMdwaMwwvd7mIElApOU1dGdJkjXcrrC09Ub43FT96e5eMTdJi9xk4h4j9Nm9Ue2jZ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Hp5NL5226MQjlVpt8yA9XVBrfAe/2M6ujvxXtj+9scw=;
	b=V0uHXaglBOL6qQuqro8rB32w/1dvUbVi7SpqAnxVX5qO8ffHrv+6S1vYEuL95ls7C9xA
	 wGNU9Lylz7RbJc/M40AyFGFpB+rFFL9qZgBqxwEDX9JLdL1OxfOQ6FaAbVirXLuW0CLBf
	 rPE9UnQBo53gJah7lZ8RmcIVyewye0W2+r87dYkK0+7WPqlZVndQqBIC16+zmGLQ3zSSM
	 2MtmZYy8MdMFheu1Krf2vTjIFXvPxtOr3yEfPLk1xtw772mEO0cqlClKIO0+HTlZIYuLf
	 R1UFWv31xz1AIbiqiJUoNXNYvuI2KhtETjxaCC1VX+ZMWy65wfUPIOphoDf6Vc3jn+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	dkim=pass header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAX2UuD5;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAF0606A337
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 13:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FAF0606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fatecpompeia-edu-br.20260707.gappssmtp.com header.i=@fatecpompeia-edu-br.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAX2UuD5
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so1160130137.1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 05:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794405237; x=1795010037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hp5NL5226MQjlVpt8yA9XVBrfAe/2M6ujvxXtj+9scw=;
        b=KAX2UuD5HdxGgKaKE8mN+DK92AKsfSeUbVO/EvEFmbuq5+sligftgbylhvdihktyVk
         AEqUtsVtpty0dckuyBrcrTcjQKXMOMieMfXAVDQi9yZPh4ceykZ4luBWaSMlarQ7dqA0
         zuHwXJjf9VY6T0GqpAvJZGpMi9sBcK9h4dsAsCMUaE4mt+QsDi4tIYuGKvF7aB/IjLC9
         YygBMOzuKws9BiZSxBrwsd5cnPBplHCsUht+/YDZNvRa7PP5ubCulh+h68vBgJ68jS2D
         XQttiO0sSySVUGRiXx8EDbG135uIY4x3SZ/d5JkG5ZOkGIeaTXzKkojRBE+YW20lTNtk
         1jSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405237; x=1795010037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hp5NL5226MQjlVpt8yA9XVBrfAe/2M6ujvxXtj+9scw=;
        b=LOp3wRUbF11n6ohvg2GF46hAe085jooclvFGiBGaBC3/NLae/a//qcWhbD8Ulzytmt
         b16vRkuENrV+7/qQsvA/yvYxV0rom+StK++MqGj2hXLOWLxPGGnAxynOuoFY8oukTh3o
         Msb+YSvFICfljed8/FlfYpHt0kfJYcY4EM7oeS3cTOxP7dvxZa0otyhxgyWsQJFKuTiD
         h+TLvlEav0iqqylxvU5q2Os391HRIqLSrxNa4S38CGfbttYq/tRQeVNaq0yyX3UJHy/4
         MbpTHtBqOGc5XDUv7rKQtdoR2txpO9KW/P3RxWS3uBQewqmo5boiPu/yURir4Ofh5OqR
         bBzA==
X-Forwarded-Encrypted: i=1; AL+hErEVT4cQkvF7/DU0nugLn7i5jk0UVd/2rxkFsbvdddTy/5/jsqwp+R+rs/zJk43GVP6AB1iLr3ATqRuyCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9LzquVCTsGSC4/yQ/oDHipd9uqey02v/oejATjeDUEykPBmyyo
	YG/2C/F4EtGQiyszGPF+dCLlmmVW3dGP/1JeBHdqgr/MhSrcXt28WEY2Q8n3IvTT/kI=
X-Gm-Gg: AYBFou3JrfVBqAJ51wvaVa1bu5hlS/487FO9DbescPu+LJScTwKcZAkz/nnLEhaYSyz
	xfJXqJsvqdOGDNdr4wKxnLgRVXyBPL9tyxlaFxbQDZfdiU/5Q6lBX9Fhn+e7LIhKcg5lAVXWuwy
	BJRmBajO9tMyfHzc8MwmGZRC89XL5VoEzDVm02aEpMKPfvrlStVIuDIE6KeOnEXX+weEaUB7tlG
	2hLlkaM9LHJ/Y6zNbl/V11GJGyaL0Osh2l0KJj9nKO0EMMOq48G87wwY+nkbDGyLSS6/jT+TKYb
	zjCp2ROSJRCUqOYtnLiG6nxx9whuHHlrenynBLHiR3mOtuH2ix0iy+PEwMsqB3+qQlgRb/Nulzk
	zPq9ALrfbMYHsSr1L2Yn8/45spsEvhOZvMTMLAIL7aD5fjxZgeVLE76XSpBmIc6CXPW7jWHbeQX
	hqOzrCYi7VtHh2/qKifhiBn0ObnvWMLvJIveEM8iVfIG9ySRU5+QW28/yjDpeZ8DW47qdctn5x/
	TL7LtpM4bA9UNi0PhqqiaITaj8OR3Bv0F9sCTo5T2bAGqus2ukPQvBti7fYmZMdiDdlPuOnZEmi
	x9outN7qAeHojFP4o4MauJmx71aoRoPyXnNnfDSImcHhuMbNaEBoRb6Yfx057rFIY8Ls4DP5kJx
	MCWM=
X-Received: by 2002:a05:6102:4457:b0:7d0:9587:1b90 with SMTP id ada2fe7eead31-7d4fb2bf05bmr480165137.13.1794405237106;
        Wed, 11 Nov 2026 05:53:57 -0800 (PST)
Received: from localhost.localdomain ([104.28.212.25])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d62241eca6sm786932137.11.2026.11.11.05.53.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 05:53:56 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] media: qcom: camss: always stop the pipeline in stop_streaming
Date: Wed, 11 Nov 2026 10:53:37 -0300
Message-Id: <20261111135338.27008-4-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
References: <20261111135338.27008-1-allan@fatecpompeia.edu.br>
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

video_stop_streaming() walks the pipeline upstream and calls
.s_stream(0) on every subdev. It gives up on the first non-zero return,
without stopping the media pipeline and without returning the queued
buffers to vb2.

A subdev without .s_stream() returns -ENOIOCTLCMD. video_start_streaming()
already ignores that, but video_stop_streaming() does not, so with such a
subdev in the pipeline, e.g. the pixel array entity of the MT9M114 sensor
driver, every stream off:

- triggers the vb2 WARN about buffers still owned by the driver,
- leaves the pipeline started, so the next VIDIOC_STREAMON and
  "media-ctl -r" fail with -EBUSY.

Treat -ENOIOCTLCMD as success, as at stream on, and only log real
errors, then always stop the pipeline and flush the buffers: a
.stop_streaming() callback cannot fail and must give back all buffers.

Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Allan Siriani <allan@fatecpompeia.edu.br>
---
 drivers/media/platform/qcom/camss/camss-video.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 5de6ff5ec..4388f2708 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -314,11 +314,9 @@ static void video_stop_streaming(struct vb2_queue *q)
 		subdev = media_entity_to_v4l2_subdev(entity);
 
 		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
-
-		if (ret) {
-			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
-			return;
-		}
+		if (ret && ret != -ENOIOCTLCMD)
+			dev_err(video->camss->dev,
+				"Failed to stop %s: %d\n", entity->name, ret);
 	}
 
 	video_device_pipeline_stop(vdev);
-- 
2.43.0

