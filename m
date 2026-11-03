Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743061;
	b=1pjh7RSHFYiZL1zNDpB9jJstshBgE0/V+UXX2A/yH2sNF13shgRGCwV8Biof4HlczOSi
	 xMEsrdKJruL6Zk7CdcrcO6SPd0k10xpj39wb4a+wVUwn9ZliTmMqNCWJzYXDtq7KVr7dS
	 zz2SS6JBbJwUO4qlLMz+IuU4dQTNd2vTUcsW7WcE2hbtx95DxRkZpl2yaKK41uaqg4mTo
	 ehL0sNoBD3w2Dp6VedqQSljjk64ij1WcWRfrtGAOFo/6fptdYP0F3oSXP2lRPVCvBstlA
	 jeEU5o2BN5E1YEBI/jzfvx0N1nz1QDo98cCG0UGyIkFLlR3HUDIwQr0W8BReihO8b/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5qvu1xb+d/MUKril1XvEor90j8ZJr5uw9xfUutlGO2Q=;
	b=MYGn25b5VlRi9zk4AbcVPJ6h6jGSwCFbIQsliKXbENYyhr4ot8FN6kAz+O0utHT7QXBT
	 xfI234017+60/5iHqIUAL9frp84o2jbCfOLxfuPMuIceivFqMsuvl9DJyURgcgKRJ3hPe
	 44vGUlVvtV8K19k9frQeucnA6ACVw3tD5yt46c4txnfeJw1fus8SbKh0hz/xvADDYwSbj
	 GyOAw2b8zzyAdjSyweXHxOwurTBNZm9nT0Kos8QMXPCb27Ln0xRJkxDfmMpcYydX/K1Nu
	 Uct8p2FR0CkT/PSOQlijKrl92IPnHSv2LNX/cj5F2YprT4PjtjLxr5ZgO8/QcDch+uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ciTFYsnY;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB56606A31B
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 21:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BB56606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ciTFYsnY
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14962645e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 13:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793743059; x=1794347859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qvu1xb+d/MUKril1XvEor90j8ZJr5uw9xfUutlGO2Q=;
        b=ciTFYsnYA9egDET7TvFrF2gFIsn8N5r99Ihufh9hMGH/MSqIsMG7zT1HMTHRtrsQnF
         Nz7jLQlJhjyX5Vsl/QxKpzI+MagBOV8khk1v6z7f7vklp9aYtgrpiMlDm5yCWDK2QB6n
         882t41ioU366uXvudJLhXHKCu7SYSG6WnNXFqaQIX8yDfbWrhAy6/FvuTD7BsfLfIfpN
         09uvnZfOu5C4IVFYVsKhBZH25ftq9VSyyZfBTwuJ6WAyLSf7fckiL6gkD59ctvHFq+lV
         p4jNLAD2+LLxxETHDbvLRc9QqeYt91rfJzH3i6kZW3TR9FQ/aVTOyiu2qx2WKulyq2Vg
         4qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743059; x=1794347859;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qvu1xb+d/MUKril1XvEor90j8ZJr5uw9xfUutlGO2Q=;
        b=GyVAYjIorTEpDlHvArc+TcF5kRabn+4mlYQJwAcSUXZ1bvTu5325kw9gOPJv9qE9A4
         tZkQ9YSJ3b14Vx2ZolGX/aVqpQTfkYUA3RaTMJJTorEon0+//iPxmWCU5Um3MTihoqCZ
         7S36sHJq2kmsPybaNDZWjBTvkPYe/KAr0opc4E6XkChixozoX2D2LjW7JTNoPVqITdNp
         TQVbuS13nNHFQKxohA+Cvri7+8wvGRrUL4yzMTZ1AytEMhDWbANgEG64x6Y1SiWurwho
         RzwkiQnwPLn9kN1hmeK0V7B5jaI15avgiRv75hjH3edr784W8te3GZjzIUYKmDk3GNEj
         Vv3A==
X-Gm-Message-State: APuU4Z/BD8Saauo/avoVDRs2nHPNwjLVFsJp3Yf4SL2gJPxokU9U1dDX
	BtOBqXLcIVe7oxZ+Vl46PxsGDoLP3AZaTw0D2EW0QdcMn7c1vHN0cTuQBn3XvzCiNVM=
X-Gm-Gg: AYBFou1B+2oTFKabqrHYIDaHOD2UnKOc3PyaNOphUqcbGC1MQ7L7NU38Pg/X0fFa8gI
	7nMQXjKXyKzWy0e8UAk1HgFGROwDbpIm//iNaO9lq4E/y7qOVlECsPckmpH11TZ+Z/FDayAm9Ln
	9nD7U4k3/SCfYOJNZp6dgvfD96le11xDwxb6MUTdLBUfU3DwCYfMNzkO+b4DuVjt7Dn0heX+p52
	AIQj/GwwI9cJugxMKcT469Q65GnWxUyqOu6cWdqG8cRIIw/Szy93LxrsXqP+Z6B0oNfKpeV0w86
	AAlKb2ikBSF+cimqIBAXtiec51hxPYKMMjQHDBrssIimiVxplyADWfMVDo9QWDUZXgwEYckYHoS
	wvUanAX0rFFJO+9lNmT49AmxO9ed+tiSS1mumYT31jlZct9BwqsU8tzEQeI4Z69UdfCynmp6wzh
	VPnYOZuWtC/na/NopUzJeGxMm1agmIv3m3jShNrlxJT6Y1Kcn1LiNJz9mY5TOw241YC75tRa27n
	uyeCP5/hd6y5o9FMOC6Vdc5nvvYHrC/8mcM3rf0q6JCQK9lG2tn1VfGYc8Ku2fliPUNFFpJDeTh
	afEsuAX2c0TFBxmGd4U312D5wCIE9G4JgpNC
X-Received: by 2002:a05:600c:1387:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4ac1793e81cmr346452985e9.13.1793743058801;
        Tue, 03 Nov 2026 13:57:38 -0800 (PST)
Received: from [10.144.41.45] ([64.43.50.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4cc2b0sm3571605e9.13.2026.11.03.13.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 13:57:38 -0800 (PST)
Message-ID: <fcdc09bb-7f70-443c-942c-81f50a695aee@linaro.org>
Date: Tue, 3 Nov 2026 22:57:35 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] media: iris: Preserve timestamps on error buffers
To: Xilin Wu <sophon@radxa.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>,
 Deepak Sikri <sikrid@qti.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Loic Minier <loic.minier@oss.qualcomm.com>,
 Jason Pettit <jason.pettit@oss.qualcomm.com>
References: <20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com>
 <9YPKYT3Qcls0jbUWdxOqIWNLjQSGexDoWWE3PUBiJS3UpxTN9rFeicV5aeaeTDyrXqw8emy9LBK0hkxmeEqthw==@protonmail.internalid>
 <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20261029-iris-va-fixes-v1-4-44a2783f782b@radxa.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 04:58, Xilin Wu wrote:
> Clearing timestamps on error buffers prevents clients such as libva-v4l2
> from identifying the failed picture and can cause synchronization timeouts.
> 
> Preserve the firmware-provided timestamp when returning an error buffer.
> 
> Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177..f790483d13d4 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
>   	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
>   		state = VB2_BUF_STATE_ERROR;
>   		vb2_set_plane_payload(vb2, 0, 0);
> -		vb2->timestamp = 0;
> +		/* Allow userspace to associate the error with the input frame. */
> +		vb2->timestamp = buf->timestamp;
>   		v4l2_m2m_buf_done(vbuf, state);
>   		return 0;
>   	}
> 
> --
> 2.56.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
