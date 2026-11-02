Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634914;
	b=KTDO9jWpEbBRXj3m4W94ItGVqGFNXAwIwSIJ2ruezFH5PeEz1ZY6mZEgmaYaTW62jotc
	 ri7XHifOHoHd04y90xjZHyiRkf2LFsuEHLnrcDvlWLra6CZ94pehl3CVImR5UTFMgRLe6
	 LnBlUIUyZG+tOBa4363JQrkhWBW8IptMspLgzACSpBnlOIZqxz8wdYx+ivyLfiKF1eWRI
	 WGpooaT/CZHECV0LcMznnN56EksJXDZ6YSb2Buhr29eWJrBiF0tpdoZ/lxK9oza+abEBT
	 wMNPOgl7s6gEba9D30ptcDl+tD3n9gB5m/kg46lck54J3KDfvwW8PlmR8eW5rkVH0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634914;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tj0iben9H416MMLvw91Gh4yeUNuYB2Ru4j1c93SqEWs=;
	b=0Xm/DiMzGoU4lcX0kGZahAUsViMEu1VVMMcyxXH74LREq3Sq0/jPcr/bDIf8XyqARyRQ
	 RfzRR5B1j3MlTOH77TuwSeh2n4eZcWWypcjuPh3bcrCb3yTdCazm/jUYu13L/S9vU5Ifu
	 CxmoNmEHXHFoYs08Myd+iHbU1K4MrAvielpA5QUZourb/ysPzzZpWrOwASDIFcJ+3wuE2
	 NYXvvfFlO4hR9JFRPB38pPBmnEuYzDrBI0dXQpCMvb7420/7FtCGe/X7vQv9Hnb/QmpLu
	 bZ/0fzZDTrckWD5jzXgV0KatW9O2oKe9qwdCIUvIwXxjJfALYAWc6vXwIOviGXu5KXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sWtwP4GX;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815FA606A59D
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 15:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 815FA606A59D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sWtwP4GX
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso1253068f8f.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 07:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793634913; x=1794239713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tj0iben9H416MMLvw91Gh4yeUNuYB2Ru4j1c93SqEWs=;
        b=sWtwP4GXKcc2Ozz0E2dWGFsv9rAtaX5GwXibv7HKepT7gosyKMFZSfc79jRgSpaz1T
         q2VVB8bKk+kB9i+NCbx9Lz4P2zO6zqTVK6XTzKOv6lmTAfhph0pfD0FJPS9mNIdqkdg8
         lX1xW1UUt2D6UH04WmZQK5uvitFNuCM6XMbJUcpbiu13uJ1NIn+rV3zMRwbwvGkb8PpX
         az6QSoLD+x0/PT4OX9paEPH/xv11i7/SgqcfwSAK0xql7NEdf88RP/BcHql7oECQ/RzY
         hicO5p6iZbMI0+Lb03dGGl8J9F88kKN0NIxEt0XsJq3aexaha8AY/NEqt+nKDlFSMIdG
         JTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634913; x=1794239713;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tj0iben9H416MMLvw91Gh4yeUNuYB2Ru4j1c93SqEWs=;
        b=Sf848JjQ18y5/IK5OmpRdW3ViH2SL3HqX+7/MPEgyms/ELKrRddtjhHh9qC8lvXKJw
         +HN1RmHrNvDGGrdT58Ob/WsaAiEfJZxl9G7GmF8JTaOt5MSI9bGOzLOY/u3Ik896pTjv
         p7e/3oFHKwIHhR8RwNeaM2Pace7DrDz5J83BA9DUsvp40pydpyqkLNObM23FHIhTH4j6
         ThAk8vE7x8VGByylN+EMkfc6pCtOaQqursWTTyHzRPne9/z2O5QtmitwC4m8kge35gNt
         1FG7v9rvsZHzD0ZEM6WCDUPgezdtLlkJfEkUMfQNBQrpmK92+2AmCTN0TatU0hwWVhkf
         snTg==
X-Gm-Message-State: AFq9FYKoQfsW+BGTfcR5lTBYrxHukDRNMywyoTWq/IBfIZgY9QmAaw2v
	wp2egQiUPXopVb6UbfQy1jhhETfXXxDx0KKU1w5v/tFu4G6VwfiBu6W4Oc3wiEI6o90=
X-Gm-Gg: AYBFou3sIX9GBBQeXrBV5BsSw1pyTVFWh8V43QWWCNa9XzqPGd1kW+FXZDvY8NVdour
	BgxAibN0TStr0JFZgBvIAcUZBQ5/JgmY1ltmxNGHu+a4BKCmk6oPtiVTEhJCZoupO6U9M9xInxH
	edpd0ARlqFkAAGDzTIb4yyTIhb7zPRXHqKCrVbwelR4q8iITBmogzQ4FCa0wbFREXnXL7pIvvYj
	MDyHOkUjXUG5ZidzHZxlZc7+uvOcjPZUyRN/0vpoLax42o1JCLHZCQ73ZPo1I5PjbfHBJhOI7az
	tylctRadwEDau9uqk0ZaH1ZiBtQnghQH2EkHxTafq5rzXSE56xQZqIHXDAOCcHa8gOP6YwbwIaV
	UZoVh6wky3VeOwbmD2oImaAqBEg7/bfRpdftr/La1q1QdMvJlrdpWmLfZ5af03gXn7m3LWURPcc
	tb72yNp615IZGYCdlfzZCLKu7hW2rpoOQLkg1RWcnkc+f2xUwB6iAyb1ReyQvOCXLHZAcyY9CdB
	Z85lYdB0bq7HKwLyWrD6/nsfBSPS2278RmF39OjA1CbYI5Xk0CiWY4CiFz8LMH5NLKZUQQP+u+1
	NTwDLNfWtFdwLs1QuLjqiRitgIBtGUQ2ieiICOZMeqfpDFwSFlLB6zzyt10=
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr247111705e9.10.1793634912918;
        Mon, 02 Nov 2026 07:55:12 -0800 (PST)
Received: from [192.168.0.167] ([64.43.42.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d511sm20300783f8f.8.2026.11.02.07.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:55:12 -0800 (PST)
Message-ID: <31115f24-054f-417f-8822-c39f3384097f@linaro.org>
Date: Mon, 2 Nov 2026 15:55:10 +0000
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
Subject: Re: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
 <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
 <0785069a-eea5-440a-a12b-3c01a02b579e@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <0785069a-eea5-440a-a12b-3c01a02b579e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/11/2026 15:54, Bryan O'Donoghue wrote:
> 
> To be in-spece

*In spec
