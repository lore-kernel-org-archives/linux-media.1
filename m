Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809656;
	b=Yr6To6nQziJLYaxP4FO4G23znQYPlBOg7VmtWXDvITM1QeAdpXiszDJnc3zPrjJM537j
	 5l5L0UgPL0Im6TlsqBLt6fsX8jBTu9GWgVGrAKXVV0pUFmjbzAeb7b0Vx1XzX6FJq5NS0
	 eKx0YNTSa49uv1TriAYSiL4mPQrgSpcEqPxjuLHvLB8M3H8plMJqQv21Xv1PHBVjGu3xN
	 +PVt9n55WyRH2PB77snNCED+eXLiDhSqonyRswG+Aa1wCH+mqkBJQrVhZhpL09wUaUKmg
	 I9h6oPAQ3uVq4Z7OXF50NJs5S2yT+SwdXdKub5mGonAs6mhVNoaNExo3O6WXR8wSXWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=d4mvKHVg0u9lhgOXNdg3AlX0ucHCymbdGcE+4K43yLg=;
	b=Ztdv38g2uqQP47YIlA1AjV1oWdoqpXkSpSH1ZB1MbSywIJv2qUHNYicskMIfzfM3aZcv
	 rwXxOBpi8XJEvVJvGB4TcZJwXUdviPIbc1/wnRkj5fQNtUvd11QSmFREuypa3ExYbqbPj
	 1+F+RFpezHYAuc+3z0eIRowWRw7ui6O6OEY60IrkZ5m76OVazfMzH0ElI2ZI6dyrQK2Se
	 Rk495sV8X1D7+REedozRpgQXeD+lnJDhftNzjADLMw3hXBdq8H4T3O6+UUk39TlqNUeKp
	 BczMwPeahGbwlgJV3lnN166ZKhPvQ18AiBtFHSqh1UXhUC0pSdhwCHZHdJ0tqiX7PHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ovwbUIQu;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D55606A336
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 02:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65D55606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ovwbUIQu
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91ba702cceaso17412376d6.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 19:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809655; x=1793414455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4mvKHVg0u9lhgOXNdg3AlX0ucHCymbdGcE+4K43yLg=;
        b=ovwbUIQulR/trzGPUe6AcLFuBGKSStkt+G9NV0x/7+h8nj3ReutjCibybUc6ZFjQHm
         lfBVGmkk5rWNBMNKWK5v0A5IOxiDq5ULKr6rKEBivFivT3xDaR2Ye/NBC6e0A5QJd7GX
         8zGnXlUgwunCf9VHNAT/nroUrPc1lGIm9inioB1hh+++u6OMboobvWKF0vfY8sJKDBn1
         ZgXiIex0X3gA6h40TSXVieXjR2yvvJITRE4YI3uHR9rfqlY0WDR7eSrGwXZd/T89JUSv
         1PpaI3mnE3HWO5RAarekm8tthS5t1YXfowWa2XuQDaOpoQLuaaO5oTpIK/O9sZwkullo
         13wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809655; x=1793414455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d4mvKHVg0u9lhgOXNdg3AlX0ucHCymbdGcE+4K43yLg=;
        b=BEeVO8QgkRhY3UyK9j1h9d46ZQuTYL+LT1MUhRy41h1VN9tqHsj+E9CIDSFzqcneVd
         KgJoia0ruH51YtVp4n5B84g9MmGSXUJD1AHKQjuuE6+3chgnJ/zCc1ssy4ECISEvqToY
         m/FbeWIb9ypB1wi955oHdV8RSslma7WtGBc/dz/hc0sVBmfkrA1zYHIgOKfV2W8V1nuU
         0Fj8b9LIHRZPUT/AMlM3y5792xlN+SWsEzY5cMEG2hCVfUdkLSxJcBDxeJKuZlQqAqL6
         c/V9wKFsRbypEJiP5Vma35b3P5g3/PDEtUGDny7ahzEaixVW6t4+JALmyoA9JRI6gXd1
         Ygrg==
X-Forwarded-Encrypted: i=1; AKwUvBx21YBCld3RCXGUHAMFK2TvOhFqjAwa4sJupP91g0WZVCqSCsPPJRNSfOPAGG6kXTmEHggzbrp1YSqrOw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKGxTmCAes4BW6Rq/3qH0DW6WzAODpeEmqp0d3jDIj6DD9Z5ydn
	tfMIVaIt0Ea0pQ17jeTzB97P9VjAedQEkDNw2dDWcJ6/rJFrTMj6yKg=
X-Gm-Gg: AYBFou1KS95Ni/431ZCgxzKYwF6wqOQWBkzhV92+hZ8JLkj7SdlxnfbLUuetnBcK0yE
	rkiqoBu6RdSwIUrNn9nn26/GB+SE2oMs/aOC4TyvV4l6hyCzZ5Go4c50uOULd7HWF6OpZ4u6AD7
	OJh8r+gYKt58bSVLLrAxl4ZWF7LqFo9/SQJvHQjpwh3SkLIQXva6SGcdqnG0yiQAYLGJia1nzOC
	X67l5Af4TGEXb9WGzePOKvPZGxq7yznBOVz1pPr8M0oNc+OH740b/YYGjEqt2kOO0iK0oW73q8I
	u++heSt+uW4Thc5ckvry2kwbCVN0Rp82+AGDok05PbM1UJ8AhgFU5xMVBKhwrzXe9TqXdtj/w9k
	ap0CfLfjn+HderGFYAr1g4FFVYqZi/sjwY8p5uWA0hWo1dMgqbBFU7IzvEXbDf6oGEJ9K7xvzMr
	SV4+4ikYdi9MEwfjWqzxURspDc95lMRDYK5JoZQp5qpVNo1H6LPjDFPEqRwbxbr/p2YmyW4WpJQ
	Jf60UEDn/loJ/k9IotekKWFBzap1LxWWY5uVOYv+qEpY4xb9K2R5WxX0rNKEGyeQ8TmkISw0InE
	ovzd8JSMuvInClBAl93gGLCU2++HnKfuK5jw0DhlZdMoEMbWkBSxWJ/kSV+7jjXm/tngV1YzGgc
	a+gYOVBlHKQ==
X-Received: by 2002:a05:6214:ca9:b0:91c:1a4e:425 with SMTP id 6a1803df08f44-91c48e75052mr14414866d6.56.1792809655265;
        Fri, 23 Oct 2026 19:40:55 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c48feca9bsm7203526d6.39.2026.10.23.19.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:40:54 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v5 1/2] media: venus: hfi: disable IRQ before freeing HFI device
Date: Fri, 23 Oct 2026 22:40:50 -0400
Message-ID: <20261023223635.3c895c4752c4-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
References: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
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

venus_hfi_destroy() frees hdev and its interface queues before disabling
the IRQ. A handler that already loaded core->priv can therefore access
freed state even after core->priv is cleared.

Move disable_irq() before clearing core->priv and releasing HFI state so
both the hard and threaded handlers have completed before teardown.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e77f68ac3fe1440a8b5429ad62a192..e7e4e78a186adaa7fd80deeb094ed53d54f27ba6 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,11 +1689,11 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }
 
-- 
2.53.0

