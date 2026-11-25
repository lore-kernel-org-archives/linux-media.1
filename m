Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612180;
	b=clryBGFL5Bf0pMOf57IYd8nDekkKxwScFoT2ZchOoILvCFnCZEYa/3f9pseFJbMBGYpi
	 x07BDA0bz51at9IGy7r1NlojeXFdNZq19aQT7rAOs2we6JG4SXefGTV3EwhyMvV0eS+bC
	 hX5mnFpF+q2e0K1yM+nmS4T5VgIg/sEErj3nzIYtLB7XWGWuicCKpktazI3z1i22s80ku
	 nguvzCIP5fLCv8VcP+eDk+d56WyKjBMFrCiOO3QHvtzaHGjfPwumB89yVSPXs0eXs6DbJ
	 qzar0lRIIGQDAV3QLgAq4OqsC2+X06B3aq1kkBCM391byF1yAvUYV8dowYeutsnh3ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=7j+iyCxJKN1obNbNOrxIJ9oVQ476N5sWokxiMnxruLE=;
	b=ruBE17yowsxHNwLjKOeiyinzD7+ZquGtCVXW9wuCTSLWJhBSGEZZoNgbL+qguix5XSEf
	 dFm6MNtbsDtYxcV3gpG4RxNvEJ9YkENDexNTlneq/+Ts/XNUriIJw2Fid2uFVSmo3kWR0
	 gso9TdOVl29zA0EHhQTmx31clMOYRMcTImYOuifAOtWqxdn/uiyBTIYxkKWYp8EwmVncK
	 nGjLeJdBH0IawyOOen9SHOI3MqPNGAbSY9R4EBScpaizfcP1zCG1S3Au/lcd94ymUqsPP
	 ItVCJKOkaJskySswzJt6B+A9aUyuZ9xq9L9ffYwdxh6l/m0LNOThZR0mTSoDiWpTS1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EhTKowDz;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6276606A333
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 13:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6276606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EhTKowDz
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2634696f8f.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 05:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795612178; x=1796216978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j+iyCxJKN1obNbNOrxIJ9oVQ476N5sWokxiMnxruLE=;
        b=EhTKowDzx6/OG0YjNneQAMFEi+zARg4WGBIsT73NISRMszHlnLPf5l5cx5TzD2ezUb
         s2W2+f3j/Wn6uPBJrWaqKaPjDV2uyYKqWZT7uoujvPXSp9cGUPa8Vbl8epCEMRQyouX9
         4klf8CEjRg6EvSi//IMzYTQAxGSYuRMerSwMW6oUMPT5mvS5l9/2gmuHPuGJvW2tD/Ec
         vC2ol8AqF/R9Vv58JmUyHY8OzHzGe5n8uDc6Zyon8hFgs5/+woUzGbpkZKzsS6+oVaTM
         IyzW94/Ia4Y4YeqAxxorrNZDMfjd7SCgqCugaX8tBOnyJ4p4DoPB6dqXNIDPLEnobJdQ
         1fzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612178; x=1796216978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7j+iyCxJKN1obNbNOrxIJ9oVQ476N5sWokxiMnxruLE=;
        b=V2tTvCvdllQ4P3UckYfsFUGoRlgpqP3GVFc4p6RSJ4OXMaHlS0kSwFHoC+KGsG/77+
         w/dxvKOaI0A2N4APGZxEm2iQaGptw0G8+Ib8tDCQ1/UV75WueUNkWXTGCDAdFaTAqUEf
         pFW7PwzgRzl1sZy1avtRHiYfFAxFybwfdLo/jjkY2bdRA4T/9mZC8XOs7A6PpxDEunWF
         VA+8tfbXooE9PlLSoNnvqes1iuO3GxSYjHPsYUiYAPNkxsRmQLaleL9gcuP7phBtjWt8
         C4JQt5gFrtf5GPm3i3vba3SmqID2GEIgkxXBzDs7BWIy+49AV5fIuz+pivDTahaBi5zK
         wJyg==
X-Gm-Message-State: APuU4Z+PqRL8jkWrc/ts7bH8mcXOz5Apqad+Q2wE7KcJIEzy11Fcnsq0
	tkjYzYNz9xj4g2SzzFfcGneOu1JfWoKN9cye1f4zX7vkW/8moBdF6kFav9QGn0wh2/o=
X-Gm-Gg: AZFdTZe93FrP5Nutd1mN2EO9oCjhQ9RMtoNpUBTPTDuuENe4nVoX5vw0MisUdbk9C79
	qmZmCKv3OWli+F0r/5sFHt/2cX5NYd0hCN7YlYLRKfJ8Ly1K9Ul+KCpjD+5mTTmmqT25wwGI+ts
	P6bcU8a/mopKtqDzMouzA91Fab8ciOy+ZWaNCn1hmBuWAsgjiMGm3RnCUtzNei5UDKnj6baKwzq
	DApNc4vIN6+36xc5azZSu2rMJbuXC4L/OEDVDzfM4fJ2JzZ672rQFEyAhVHona7ZqnT9v2+TwOQ
	5DQ+nibvB5JH1FPfHpm/iRF/2t8M6Wy9qcDwJAJIqUG208aWcCfQXSbWXeaxzlgCOou1OojRbgX
	mA1SLlpnQH+68/FbbWxodKWaAfZdHi7ebZL/Tv1jPzqrGJXX/UXMp8WX5+WQhs5kmsxWQWA+fhY
	I2Vbrx/ZMrDG03m4fpsPTELSzqxbCP7s7hP307M4R6cjHXn7d0ThYZeH3rTT53I0m3vJFUlX3yb
	dcIT0Hfv8j2PpmIi94DaHcf7S83iLJIU5K8KcebaQPYyxyEXfu8UsdoOEyyWgoaeUx9VDnFcMZx
	y4PfMHfLrzDs3gjMzkFpNrJeth9mCjVLfKou5y7Uw2P9B4Kth2cY+YhipK09Unfxbpv6Cl8=
X-Received: by 2002:a05:6000:4808:b0:4a9:760f:1843 with SMTP id ffacd0b85a97d-4abb0d51e12mr34353972f8f.27.1795612178043;
        Wed, 25 Nov 2026 05:09:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm35240355f8f.2.2026.11.25.05.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:09:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Nov 2026 14:09:29 +0100
Subject: [PATCH 02/11] media: iris: restart the buffer sequence numbers at
 each STREAMON
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-topic-iris-decoder-drc-fixes-v1-2-58b9f6b3fe86@linaro.org>
References: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
In-Reply-To: <20261125-topic-iris-decoder-drc-fixes-v1-0-58b9f6b3fe86@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, 
 Hans Verkuil <hverkuil@kernel.org>, Vedang Nagar <quic_vnagar@quicinc.com>, 
 Wangao Wang <wangao.wang@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xfhCJPfj+HQzhgU+bAL70IYvzzbzMmf2vG9VFnrCgEI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBt4LYofO1WutbbJhxzJ+OJv8HgNEJH3O1B4oanNz
 fraYMzGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawbeCwAKCRB33NvayMhJ0aaBD/
 9M80Ada0ARWG+VVjmaT6D6TG4wJjyYnva6RYZn/tiSxtwnQK1rhi2r1MDPYV0d8I/WP9ny/TDJvjvu
 5Dxr0M+DQ5p8KUbKdWvD5FcpmAGTNetvnuHacIggt/t2Inh5UgBbSoUaSnSQS8Lr4x0dGG8caaDxjV
 64jWkmyOYy+Bo1VP4KO1FK0iEXJutNU74sNUUExOHA5xjgvla3oejxb6UgU3nPBl9+nZ5unKfZrVji
 4bJ3Vs9TX9j0uwcxaQB8fROT8Xcx9K5udbBjMNySnSJYuP029dAdgHOaWnq7oBqG/hAouaXeELTIMd
 Qx3nBvSSKd1KiXI4JdiwqSsLqQgCdHOAAAyeXPZ2LnlFOwXYdGkV9vWrXX12I7zL7UOc8YBrsh8zuK
 H9i7b327qEvUKem1+E0Q1lVaOHgMaf8P3WfiNV+oEhe45PdqmiQyMtHPnCl3N9vC/j4qsllxPivq4k
 3nxSG6InU2hDJzdcgtq6PMrwE5BhIRGQ+rrb/CQy/tf4wHFHl5t4lgoKi2Ypgty55CyqMjOviR4rPJ
 0UwamQtYXJB6sEYK2j6Zx5p+D/DDpiZnGDKUkW3a2u6nhdW2W/LdmNs2MP/svpk0deuS/3K54/0bMG
 mHPwzElSMl/0HfJ0IWKnYl6SEZ5kG3/KSVFGhVvQN50yxWbnenaSluHVpdeA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The buffer sequence count starts at zero when a queue starts streaming.
The OUTPUT and CAPTURE counters are only zeroed when the instance is
allocated, so after a STREAMOFF/STREAMON on either queue, e.g. to complete
a source change or for a seek, v4l2-compliance warns:

  warn: v4l2-test-buffers.cpp(470): got sequence number 12, expected 0

Reset the counter of a queue when it starts streaming.

Fixes: 17f2a485ca67 ("media: iris: implement vb2 ops for buf_queue and firmware response")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
index 2460778c408d..426810c848a4 100644
--- a/drivers/media/platform/qcom/iris/iris_vb2.c
+++ b/drivers/media/platform/qcom/iris/iris_vb2.c
@@ -181,11 +181,13 @@ int iris_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
 		goto error;
 
 	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		inst->sequence_out = 0;
 		if (inst->domain == DECODER)
 			ret = iris_vdec_streamon_input(inst);
 		else
 			ret = iris_venc_streamon_input(inst);
 	} else if (V4L2_TYPE_IS_CAPTURE(q->type)) {
+		inst->sequence_cap = 0;
 		if (inst->domain == DECODER)
 			ret = iris_vdec_streamon_output(inst);
 		else

-- 
2.34.1

