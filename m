Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229379;
	b=SVkOXUUyjTxuzYrfycum3vEzMeiKFlukKHv4h4X/61FBY1xEDak/j+t7EOCKxyP/Onje
	 Citkz82ZcZs2/LOv0Ej+E6NogDVnKuMF4XuBRVzMtnDdDZBUNoR4ZcY0BzaOFGpKb7g8f
	 w4HJnUdJKM5a0j/h9ROe/6Fof2CMHvJ5ljDT5IvDZOpsdRsEbNFAD5TajwRQkb5PGvUwX
	 WJlnvDJv++rxuWJZ01+BzF331PwW0O9fzWk9+7qqE7jEthOL5UQlLv5Fi33CSTI83T9Ko
	 kRMjOOfSg0F48bI3Zz3D7nbuVpo4+5lLYKMxxJcOuRCIV/M/ovVDm1VZb5I8G0pl+Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=2pqezEh1l4R7qbedrIHueLpYvtHBQ5vBsWVh1r02B6E=;
	b=tuGnhOLqWN14w+jkkb1czx+4KqrBZVvG6cy9ycOcvzdIC/WR0nNFyWZ9IqBZzjoKlp1Y
	 Lw04k7j86heVZej+kmEZc1/oXv+ET+ux8wnASIuAbV0IyqcxgxMV+X8udv3oDoF1vhH/1
	 ghyjxrXy3yPzWHwM9TdPAOC71kXcduQm8g8ILfxXvmGRJRCbF5ImbWmOlyY+v5TD0Pekb
	 RHwUl/O8Cgy+GGkUwvwKYtsPjpXimkunuJes2x3Ya1t5IXf1UjKywN6Z07JvEo84Y40pU
	 wsjH2aU/CpsaHP8XKnVe5V+ByrbU8lnDgzHJ2+cD7Gdrxv6ANu2Xn5nm06usMskgguQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uzwViQ64;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A75606A332
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 13:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A75606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uzwViQ64
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d21051042so122567166b.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 05:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794229377; x=1794834177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pqezEh1l4R7qbedrIHueLpYvtHBQ5vBsWVh1r02B6E=;
        b=uzwViQ64DH2LIUj+FzmUKBO0qVhxfSrG7q0hxpNX4RC2k0EXoO25G2zdi0yjSX5gFq
         EJBYQnvz0n1EdlPUpZoNMOrpxkRXvgBkmns8wMCEz6e1GBSxGNMJchdo9MQInL5EAPAb
         lh9Y7vTyR3DZO+u7NvFvzzHdZzTEDWyW+mot3rsG/qPrLxgfF5sqCPYdhnCtIpM0hdh9
         UcJJdQUR2X/rtjonn5+IRPrA7AZEclxBAGVJlI2loWeQFlkVcylKFrsKrNI7UZVaPI/Y
         FbjsEIIEg2/UMK53aMS5yqNWwXs1XuVsA6KQoCFxHjN7rFsO7aFRJphbgQ+FZyK0SdGQ
         jF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229377; x=1794834177;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pqezEh1l4R7qbedrIHueLpYvtHBQ5vBsWVh1r02B6E=;
        b=QfjJ3WPHTzD+UdxcBFHnywd/ysqdtcJJ2O8WT6HPF0Ni4Sj7FMTdCpqVDvpq7bwYM+
         2f1zU7ptO5VecLSOkx5oxfkRjiSV/qVcr+5a1UFbiGDkj59e9tQxJZwPGdXJ3n3nrSY5
         0ODdJWr9Xe8TXbfYo4lyHBvnSMZBSyDM8xTJhUtA8b9LOgVEientLIwUWFMmbUNxUDds
         gsRyhCJeNrt04eKuKs49rSu7TlfTTJI6OYVWwaUAVR1qjoD/9bgLJm8+EoXvyw+7RTxl
         0oeRgFITml3g3A99rlMY8mu/bNY4tVcyV/G0fRctqI9exKz5C/+98UKebIoKkDStOzwP
         4A6Q==
X-Forwarded-Encrypted: i=1; AL+hErGJ3b6qTYvYfo0dPQU5Hm1BcSuNvaAmtUiKv1PyAPWCN1jqGsFMcfzUQoKGdUvatGuI6hhuGo3yS0oZIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+UxR6iqppzfJc9Dt/Lo1CFUbJrZI2ZRcoQoHC6VG+AOHl00mTs
	duMjxLBth/SxlbKRQZj1QgCf8b0s+r6J3OKLqKhPWpx/Po5BYbPbEKFRX/Zu0KsixCM=
X-Gm-Gg: AYBFou2zO3CwvzKR4Sfrsa11FjoM5OobsKWj2t2b4tAmbRwxl1Z7h1xaV6fwIl/1cSL
	wTD9qHhzohsK/6lA8F+eKZM1W2Arfvz4iEQz0YxpNqzj4v923Isnz3GHpqST7eSS1J+x8sLiTxw
	nfOJCTTThLg/q4M1bOqW57HbkRk20bD8sHlykm2L7kDsctj/7aG2JHw1AEKLmxiqK9D727bW4+3
	yvj2Lr/1GTKZ1phPz6TvVjBsLEWbzQ1xJcK1w1mzJVQVmB+HuN5NEw3F3A3QKk5TpArHZd/ZogO
	nqcYeQKvOcwn/WkvzGD45DC/U3lsGMqAGyoUftke/sY+f865DLeTlxBUJZdDTxaOkyiMmI6UvLi
	hxLw7OppWkF87j4g+S8fk8kbQVc75feK+ZYpsBQa+Xl+RMZA7x4WwOnP/3prMY5+WJDvb0oD9V5
	2f9aeQzseo7/om01zFmaH3pg3fvHSpG4GbGWHdDudMuAaX2182VDqpdHTRmnt2t/kswnqZFA13z
	GJBP3vboEF7TUSwDZTuJvcAhsC69K1Y2SCOGHDAzd/9fvs3G9LpjG5C4oeWaStcxfRpUM1vB8OZ
	iHO1TQmNFwUb3z9QHbisVdzAs2ydQLVu5Bx6LGQ=
X-Received: by 2002:a17:907:6e88:b0:c49:bc1f:fe2d with SMTP id a640c23a62f3a-c4d6d4fa5eamr275959166b.28.1794229376222;
        Mon, 09 Nov 2026 05:02:56 -0800 (PST)
Received: from [192.168.0.167] ([109.76.74.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f9483esm163287866b.19.2026.11.09.05.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:02:51 -0800 (PST)
Message-ID: <919e9806-5e1b-49ee-a88a-7b6dd6d93c18@linaro.org>
Date: Mon, 9 Nov 2026 13:02:48 +0000
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
Subject: Re: [PATCH v2 3/4] media: qcom: camss: always stop the pipeline in
 stop_streaming
To: Allan Siriani <allan@fatecpompeia.edu.br>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br>
 <20261109112611.94010-4-allan@fatecpompeia.edu.br>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261109112611.94010-4-allan@fatecpompeia.edu.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 11:26, Allan Siriani wrote:
> Fixes: 89013969e232 ("media: camss: sm8250: Pipeline starting and stopping for multiple virtual channels")
> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
> Signed-off-by: Allan Siriani<allan@fatecpompeia.edu.br>
> ---
>   drivers/media/platform/qcom/camss/camss-video.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 5de6ff5ec..8341666f9 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -313,12 +313,16 @@ static void video_stop_streaming(struct vb2_queue *q)
>   		entity = pad->entity;
>   		subdev = media_entity_to_v4l2_subdev(entity);
>   
> +		/*
> +		 * Subdevs without .s_stream(), such as a sensor pixel array
> +		 * entity, return -ENOIOCTLCMD, as at stream on. On a real error
> +		 * keep going: the pipeline must be stopped and the buffers
> +		 * returned to vb2 in any case.
> +		 */

this comment is completely redundant - it looks like LLM word-salad.

Please drop.

>   		ret = v4l2_subdev_call(subdev, video, s_stream, 0);
> -
> -		if (ret) {
> -			dev_err(video->camss->dev, "Video pipeline stop failed: %d\n", ret);
> -			return;
> -		}
> +		if (ret && ret != -ENOIOCTLCMD)
> +			dev_err(video->camss->dev,
> +				"Failed to stop %s: %d\n", entity->name, ret);
>   	}
>   
>   	video_device_pipeline_stop(vdev);
> -- 2.43.0

