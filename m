Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795728619;
	b=wny6+oDrwMblBXFdRiKVYGoKD0sc8zC+AB9XbxYbJ+TmDkfKAtOkiUL61XZeHFr6Lsp7
	 EodbM9Z/lT5FjTIF6ADLO9ZgX9BE7eY28NaKkfUnGx7E3QyBdJj1t1u2SWo/SdtzrJTL2
	 zDd9e1rsiE34xkfPKryCyimMNlkugU2GDFXp3GSzPgZADBAgXEx6FQYOaEaux0eAXx/JF
	 qQXtdZDp0tUBooQaSQDc8TjD43a60Gyn0c3+D9lZnktl3T8JJAcQo/RaZR4gOKybNTnTJ
	 zmdxOnwZI+p23f/e/jIrj5Jes7k/YY+l5Jx9ZWmIgjhdt1yNIVf5pY5zVnkNyaNxXoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iOPO62h/bywbh8sInLBXyMX7z+WqEK1+RUSrIN2sZII=;
	b=s3EAtike1wVu0F0tp+vPq2xSAJ9MQIugt6arVbJPPyfc+7xnzWCnd7uEsqERM9TXhQYV
	 FzMGD/b5rozgyrWeEjH/EpNkX1SjBuBXN1afMpzLiIOFxtHuo7noqH/kM13QXBQW7Xt2t
	 U9sfUBiFQDr74K+uBWnCIIaSbj2CyF50eK4YOfVuAsF5oxe8OUgkFAIu4gwFY5hiGTsLV
	 5zj584ySUWYQXjIDsVqqEG67Ohf+C0S+u52ItbZ4B4Sm8zkoJU+V3WIupQE/Psz69H8qL
	 KgxWj/E7E/tfX4i7+HhQKbvjcEg/q4xZM7NGFwJCxdBIwKBbeLcRr/Hna10sUMCr5Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I53YA52V;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53244606A32A
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 21:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53244606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I53YA52V
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so2640621eec.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 13:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795728618; x=1796333418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOPO62h/bywbh8sInLBXyMX7z+WqEK1+RUSrIN2sZII=;
        b=I53YA52VS7cLPkGcXcn3YJRSmNvOvESU6KsDMe5/nmW/v1W3Yon18BsQkYZe3KPKZA
         nH8Nar0mfXk2ugXmjESGCq6Ng+oTds1uE8CtK1dYDogmtWW26KNqpLtJSKXCfBZXq+9v
         SlAVBsK2G2kovZj3YqhFHEmegv+Tknc0P7LGL8sxMjUE/63SlWzlfjmLiyG7KzGVtyP/
         a64tF+sYGjZChHj9TG0x8vUW/jb4TvB+37bbXz0IgNpuLHfmgfkuGouTe1E5Dc/fNher
         hYfXKzSQwJuqELTvNNYBeah4PA0DHLtNQ1V92xO0OYln3F4HmNJgdfgMUs9vUtbmsQYE
         dRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795728618; x=1796333418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOPO62h/bywbh8sInLBXyMX7z+WqEK1+RUSrIN2sZII=;
        b=AcPnFy6hhx7NyMFLaMMQocrnEdR46LUWaHrlraUEFZBlUq8x/a9iVmxTrkkNQ+O+6l
         dsO8UzEzf7zHdht3PXZpRMa3WsMqH42Ln9deou63lqPsAjRvIOM5Toh4CJl0oOQJo5RY
         GORdRdIfpws7i+TRlxDBneh03T/6AUJDNTgiotdsieCg5u+wQ+gaYq8fGQl7bbMTwhj+
         18+5VrzyvV9hRVDBvZEPS9a4FEEujpFLbcrJlajeLArpLLVK18df4RopxkZQComWrflr
         zOFYzdQ6p8P0r1xw79VcQ3beivRrJIFHZ759273ypoWkbaiGjleGh+Iqykd51SAbx6fK
         Xatg==
X-Forwarded-Encrypted: i=1; AL+hErEtawVt+jzMdbV2V+KpoN6LMhHIIKwDenO3dVn5WykM+BlPWd/cE4YEYPyvqm9Cl7mITR72xPfdifp9Gg==@vger.kernel.org
X-Gm-Message-State: APuU4Z88somIkkwtmkj5d+SVMw37JummwgvAIxvYojdFS0/Uc/doze6K
	7NFf7WYeLMDZ099DdI2LC5lXqILSwdUftq31zxCU6aRZoa1bE/AW4QZk
X-Gm-Gg: AZFdTZdnoDkeYQJzfh65Pty9tgU3iiRjlZMk5K1XZh+ww4tTkpuMc24jfsZKoI+IxwT
	gC8w0ltazEU7rQche1dsmM3quh+6Zd8OFJpKLr7JWuXJvgYpHSXjrzSO4136Dfm0xhsbI1SbkxJ
	bIm2araiqPSjDF79l1zg003KvISrG+g751cMZQoWM1soYHX2MV5z4b4PRfwe3vyZ2V7HmdL/LDT
	rsdPDundDWMGoT5frL7G3KtLisDrhuAcoD91YygW2qOvceDH4Xr2UpQqJeJ/VhKwD0fOuWPy5fT
	6J/rlVy03dj5FzgJu3PyxuBMC6qQA8La/HjQhLVjgIAxIlYINZZ7DTGfubrqPKDUlX9Z4kgj9v6
	0HNGoDrdxaef+teeNo0NV8bmwnYhPKpJY7qIJyEHgNOEHIiEfdwWH1ZuCbEOSXz6un6ThKgC7MZ
	puerodgkK4/lhd8Ch649NyTP9aTFbIrYbPI/XZeBQHjKYC8md6zzfRjyffIzh/mGlNNC8Z/F6nn
	+gK0c8MWlz8BkUdS9eIPREk23vHq0hhW950kaRqn4cRw8egl4XeosXwgt/N5ie5806xXE1Rx4I3
	mYT01olwW6yqvrBOWV/1AxgBI2iI+acF5acYpeOwIx8aRT0IM+UzYjIxQMX/emqdxn7dYI7heMw
	eaXrVtO7RaxGVMdYCHoupl3979JRoi4EVTHA4HuoFNt+ONA5FDpD1YWfvbGFzcq4=
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr21751213eec.40.1795728618321;
        Thu, 26 Nov 2026 13:30:18 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm33434219eec.9.2026.11.26.13.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:30:18 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2 1/3] media: iris: reject packets that are smaller than the size field
Date: Thu, 26 Nov 2026 21:29:02 +0000
Message-ID: <20261126212904.27207-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126212904.27207-1-dennylin0707@gmail.com>
References: <20261126212904.27207-1-dennylin0707@gmail.com>
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

iris_hfi_queue_read() only rejects a packet size of zero. For a size of
1 to 3 it copies less than the size field, returns success and leaves
the read index where it was, because the index counts 32-bit words. The
gen1 response handler drops such a packet as too small and reads the
queue again, so it gets the same entry again and again and the interrupt
thread does not return.

venus_read_queue() converts the size to words before it checks it for
zero. Reject a size that is smaller than one word here as well.

Fixes: fb583a214337 ("media: iris: introduce host firmware interface with necessary hooks")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e2..12a7fd0982c5 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -81,7 +81,7 @@ static int iris_hfi_queue_read(struct iris_iface_q_info *qinfo, void *packet)
 		return -ENODATA;
 
 	packet_size = *read_ptr;
-	if (!packet_size)
+	if (packet_size < sizeof(u32))
 		return -EINVAL;
 
 	new_read_idx = read_idx + packet_size;
-- 
2.43.0

