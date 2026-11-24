Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514173;
	b=R1EBDtPtQJzi7fqXb8YfbCA39JWjwgcfPlrFrACrQVgwXf8Yhs5z/7k4S4D7BBShXtMl
	 hTfUefh8j54cOOkv7MTg+Yc4cml0qgv2axDpvmadWqEGoAvPaGfpdlmZDwLJOPg2xU1I4
	 N8Kz1/dCU/ebA/gsC4XG/b9OTafuhsCqjHX2m3dLaOnDtTEa9pO+9K4WsHFQ9R9RoIXPU
	 3aN7dUoGzrwquBXHFdAY6qE8leaoYFk21vSy3Qc2u1VKXA8DB+QuvawCoqJI/EZbKdX6W
	 xxROpU/2HZl9GdGUcxhaimJKf/qN2uE+8he+KClMMc8UwIsLtD9t7iOeqcD7Tkg44gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=idxfymof9qrD80mDCSy8sLfMw7IHnfMauze7irnybMM=;
	b=kMKIgqHHyHXpryMkTFUQ1yXar6RFARnV3dpbhIZBtlnvHgfignd++yLwLvQB/Hedl4um
	 Kf47U5lJ0+OLOsuUZyrHmmi61HIsOC7klC+Ld2tztp5d4lsMxW5mPOcJxgSfOrQ7ccjz9
	 AxeseZx6uogAQdDfECilxpR7GLodl3D+/mh1ktVQ/J6Og4HF7/qKIbeAhHESpQEenHCjn
	 HZIVDQSsDkIipXxnFXCs717UwT8f2RmijZ1aQwQLSuMXjT4hLC3LNGosv9WDqoKnEF9Rn
	 QMSj/IDLOm3qfvUtttqmsjt6cX1jDtwd8CgBLzO4xWVvnNau1MAeXvrqyy8D0UQSQwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="O/Q2gBA+";
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A655606A682
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 09:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A655606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O/Q2gBA+
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso4949577a12.2
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 01:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795514170; x=1796118970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idxfymof9qrD80mDCSy8sLfMw7IHnfMauze7irnybMM=;
        b=O/Q2gBA+rhMwstg5y938RN+PNof+guIwVSXQ2D4BlGB6ChOpIcCDqP+l9UIfXKeJgG
         X4fK/+LjSo6q/p0914sAQTtkD29Y9wgXVqSVhqSWRcglLQ/7IeDtZUBQWXhLV170fpPY
         wlxPU3lxc2pP9OK6kJAogOFqVCd0iao8JypNWp8uRjII3h55+FSskq9S+6svO2ShtI2E
         gFbpSlFvoBiT6elxWr61tvu/S5XY/Cs0ZdXr9twWCFEBcMfhTI9frUVO2LSOqBLKjnoR
         F5lEs/Hk9H4N+zaf8Oh2qDN2nwsEb3/dP9dOy/J4T2Mle2FskgZwW8R9YgBpC1AKUNf5
         1ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514170; x=1796118970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idxfymof9qrD80mDCSy8sLfMw7IHnfMauze7irnybMM=;
        b=ZdzYy3AokyDbfOmqz1bfB4OhMJUXFoHowhVzD/2lKs65zHQS+cEWPqNxYQtGqC12LB
         GhbnIQ54RfEAcbqP0sm/WtYCCvlQ4n+3a1yaBqk/zrqw82LxdhN+fa5k1ZB2vboG0BHm
         Lsm5j6kqf/Umv4u4/H/uxfMlHbulI05Lib/A20HtDngylo17KYL1FAB0UMNX3gvWjEvs
         8HaS1LxH+B1k+MYZQj6xV2BmIrxQqa5QOgQOmJQTUmVq7Qmky5KXfVVlFq4dqHYff28k
         9JD8GEvV6bcV1CZ6cGmmZoQhk/5iMk0bSOqT4ixJ6e4erBeSWWctqTSVVuJ2zzTmUb90
         8ZSw==
X-Gm-Message-State: APuU4Z+O+2RYnOKdD9PDCDg6B4KmiihmkeOVea+JhJkaBbWRVGKSWxO8
	15o9bzEQGzEjVrUjZpYvDthoZk/Ufl2C8rfNMgdGUxOfWWfO+SOvtd5sIOfd58inFOs=
X-Gm-Gg: AZFdTZdhSDuUxXRPl+YIRHcBGkoEOnO5o/yDEsT5dwwe/GTLP6S0Z32pygNTvpWEXqW
	tAwxjhTbfyDfTeKAup8haeqRYPKZ9Wf1y6yfdwoQGDiK3WcF4jeysr5M93SVBimAn66yfMYHZcP
	qygpfCdgZ3FJKIkMmZnaXuDGpLVgVIKGJiWb4jIcJifzucuAAqaEBxp5hffZH2r4eXg9EmtoX2I
	mYgrqBIamM7EI9EmjZFTPRNY3v5anfXnSv32ndr48e3ieYmiFb6YStGSbms6SBnylbPhOVa9GKn
	1IlnxTDxX2KWHvlYd4ZEONvelONGSSfLFwYH2swRaxnUYAhe8GTLtwNbnyQC2lQjZKx0mY/YurC
	VBIgX9X85p69OsxOvpHXJ6EK1FOmK3DxtIue4Fa5xXJmfIXrp1OPqlO0NzdxLV+6dWKukggotpH
	f0OLYOb7yMdnhECEt210wSGWN2qaSCfLRqEf5+8omiAYT2BH5nqnAjYC+QXaus/rZJDz6zZd7Ja
	yH3tu6cvps19yjB3//rFMXnU6CeCVQ9s71AqdFDsrwK9DCH5OIzcW96jNvgDnJR1/mnnkmdC3Mr
	t9Gp7CUJDF+19A+3iQaJFem6d+QXoGRLRbeSuv+iq+g=
X-Received: by 2002:a05:6402:400d:b0:6b3:f891:c2d4 with SMTP id 4fb4d7f45d1cf-6ba37ea5360mr9116423a12.29.1795514170370;
        Tue, 24 Nov 2026 01:56:10 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3710601esm6563505a12.27.2026.11.24.01.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:56:09 -0800 (PST)
Message-ID: <089ec1af-b6ef-4a7e-846d-3f8ac5e72ef1@linaro.org>
Date: Tue, 24 Nov 2026 09:56:08 +0000
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
Subject: Re: [PATCH 2/6] media: qcom: camss: csid: Pass the SOF time to
 csid_sof_event()
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-2-7b62dda6d7a9@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261123-camss-hw-ts-v1-2-7b62dda6d7a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 17:16, Loic Poulain wrote:
> csid_sof_event() queues the frame sync event with no notion of when the
> start-of-frame it reports actually happened, leaving the V4L2 core to
> timestamp it at the moment the event is queued. Some CSID revisions latch
> that time in hardware and can do considerably better, so take it as a
> parameter and let it reach the event.
> 
> Every caller passes 0 for now, which keeps the existing behaviour of
> timestamping at queue time.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
