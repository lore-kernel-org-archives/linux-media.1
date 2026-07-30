Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDB382374
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440099; cv=none; b=P+VA4pmRqQXyeb72XjBnH6zhSI9ErQ1TVnRt9rlaOISNcMZOX4e9wyFRJgy3YBqAwQM9Ny8r9alXkKOvUDEi+spfbGBsKvamM3XBBB00rjNZUOT2RZ8v41egHPDpEJ0hFwo/QSI3rgXSELudxMeHdvWvOxVvUr/m13QAT8Gitxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440099; c=relaxed/simple;
	bh=A9kTsIlpFM9/4kED2Jbar6fygXdSxA4cqWt7xu3coGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsklkTreq7Yka+TVDhZdBm/MrX4hSWw1lfPpHuNc3UDw88Vvce8wosHNxBl6UF0/KDeQum/S9hYtWirMo9jZZGs1sqbfBC4vpG4I4aVJPHiYajSfZUjHd/xXWZZmxlOEmV38BBn3JbQMgDTNmYHzogbaV2WCe7jL0FE3Xq5zVzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zVxHl0Vp; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zVxHl0Vp"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4720f3bf164so729726f8f.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785440084; x=1786044884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Xwq7roaqwaiY129Ws3twDa5FLFPnW6tapCxowp6w0k=;
        b=zVxHl0Vpw3rsME+vXOLzhu5WVxldB1vgIfkdB7DNp8tVWdkNhoUOSfEG+oMMfGGZrQ
         XvNQA1vEpmyf5XGZ+BSiPU8nIOY3uNK+zneZa485KCLDxkm1UwnI4CMLujhKjXaTbA/U
         2tWR8603j/HtG4+LrFiJChUAVZN/2/Esv/bagEsz/sPWgg96UhDwUhWgo0LqTJFyKUDC
         iiBDVCF2D1wASc+XzNvgmga8BKw7qJlp3XRsqR8Twz+uK1tfLBbvqwidtdJCfLfE/QIj
         HRyzCwywon1nKgrMFhBSiJQpUZbNk4uwlMANQiOf6FJzYO8pQPWHfn67Bslbs4E7QOsj
         DU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785440084; x=1786044884;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Xwq7roaqwaiY129Ws3twDa5FLFPnW6tapCxowp6w0k=;
        b=sllgE26OsS4BLuJegBasx4LlHM2ESkuP2whju5LVuFfqdH4J/mcy5GYl60+Wi06X+O
         Vv9JsZJ6nk6H2J2eQ/wbY13tWtyowVdqrtHjWwNSqu2+cbk0vXqKoG/Vm/ys1Flvfmpm
         DcpLheP5of+zx9XPtGJ7/mEleUv0d5J2eKpNZ38RusbNykOuIYMx/abi9+8BbDx+oyJT
         J8CLoZoptHBWkr4jCD5FoV4W0awvE/MSz29myNAATCJzcxJXAMizPs4cGuGOsTXyzQvR
         DkFduUaoUjcEfI/h1TNm5282x9YckoYaVAL3nBpa0oCElxFSRKPJQ3Y/1yN88UhFNNw0
         ctXw==
X-Gm-Message-State: AOJu0Yy79dnJPBTFIQA7WkFBddIitia16dfHeTkZffSbgvVLR+hjg00A
	g6VlXeZkRnhQYC/nPr5Lfw25+ZZJLnB35i6gLm1rnG2F5c5lG9/rK8dQg4CBVWFrX/F371D9vly
	G8Y7nius=
X-Gm-Gg: AR+sD13Bg0QmXxGJn/An/xZkwIY3zpS6NYZjMKZJUhr1KNr989ARzpyF13dbZmSmEKV
	yY96dNHzdFYXKlG+kN7ELBZv0bCm5I2o9Wi68rwJekstoBBNsKhog0QCq8t+yif0jJNzRMb4bac
	BjdnQ6fTrNs7RX+eDWhL321aPfg1mZ7tDTA0TlJbbBa0939sUz8Vnu53L+WvKuHDxX4OOM51pcE
	EiYV18qBvqBjfJhwX2G9h0bioQIlOXLlSsn/7q4QGLKLsPsm1d2ekEUnfynmGDo8Sf0iRg4te+5
	KnwuolSdPEhdgN4th+ua4I6pAcoRNGl9kxoaEjubnbRqtCQbKW2L2IdHZ2dFmcxYkxWvDoYzy9Z
	ORBmylIX4YpOpLHPPCOKSJ9DnChrLf5/8b6Mq70QnM2mVUxgWjgI0xsTqDJdbgx4COVea2apV6h
	/CtI7VryUg9gYw7u5npjIX5DwxGEe8LqJJp4PZmU+hZcI/ysP4ZBHVJO+yOztXFlDUDFJNEAx/
X-Received: by 2002:adf:f390:0:b0:47f:87f9:6ccc with SMTP id ffacd0b85a97d-47fcbcddac0mr1938150f8f.30.1785440083631;
        Thu, 30 Jul 2026 12:34:43 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.38.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e4721sm6911106f8f.16.2026.07.30.12.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 12:34:43 -0700 (PDT)
Message-ID: <c2636e38-fde8-4ab4-8103-c3c21dee5c1a@linaro.org>
Date: Thu, 30 Jul 2026 20:34:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] media: qcom: camss: Add PM clock support and
 integrate with runtime PM
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
 <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260730-camss-version-v3-1-74a87302dd9f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/07/2026 10:24, Loic Poulain wrote:
> +	ret = camss_init_pm_clks(camss);
> +	if (ret)
> +		goto err_v4l2_device_unregister;
> +

I don't think this makes sense if !CONFIG_PM_CLK

->

I don't think the read routine in patch #4 should happen if 
!CONFIG_PM_CLK either.

Happy to retain the RB with those changes in place.

---
bod
