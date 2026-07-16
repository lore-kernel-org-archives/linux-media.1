Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB72D2DF717;
	Thu, 16 Jul 2026 23:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784243331; cv=pass; b=QLyKtg1tN8xl+yUsQb/3ubz9vN7tFrOgwwTHRM1olPc4TK+KNHzSmftDnpmC19SSuE+WbQSEFsqNLH6OMzsI+Hx3m6SIW2OEDFj+6Dxpw/dJhTmNk2H1JZxdHe6zH6v3x1bdOt+3Ivlu7NGO3U9nqHxYh/fxg2JUOlp1s0r8/a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784243331; c=relaxed/simple;
	bh=JI6Z785l1jaXzWoH6ZjDJqo30C4TDnlDdSSexW+kpgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J1SK78aLqpxIqB0PvLoP7rWM/u6Q6odc3/lx78QvMpR7G0zRHg3nSs3ROl1uftll1rbthzi8pQYUqtySDeueKlNQHN/YPjBnJJV24h5fDRRdyM48XLv7Yd8SVv7xGv3xexeu7yvaAnovKKSmph2AgR4mMFBuKyQNWHTxlbDmSYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=X6yGHRwP; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="X6yGHRwP"
ARC-Seal: i=1; a=rsa-sha256; t=1784243318; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BlIvqUaOxtteu/dhydeaWYPLXm31QHXcxGEIK8iw7SuHvYJ6OnHsHWz8MNllgoczgOSOIgiXwC8OQR0okkqu3aJbFQOU3Qrl0gKDLwi3mB3g2qARQ6y7+hN8paeyL0nRpI2bXul4Cc3qnnGPvb8Nk7ae7PQOFhqs+Dvkhux123A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784243318; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UDJ7qwaoIKUl67uVdh5vCd23Dcn5LTlGir30uhmz0mg=; 
	b=T1/QWSFVXOhWmtQAks+oCDwYYVOhCiwbOKw0Ql/liPf1NAsRAAUmrA4jqfyTuGZ8QMHdOrYGEL0GowOvVdtVD4e+1+IG3x/EOBXoqezrND0dyJkwowdxYs2V8Kzx4DCwk0gBa55595f8UG1LZ/OXjYajsv4e1Mytk/fwpe8s2WM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784243318;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UDJ7qwaoIKUl67uVdh5vCd23Dcn5LTlGir30uhmz0mg=;
	b=X6yGHRwPOmkRNUmD/+/RmZ8CG0jdcPP/56jYhWTGoDhsN5Ot/FYLxuVg9nnfdQOH
	j0Zm4lHM/lxeyWpB9hhh6u4kfL4eqB8CukEOtyesgIjWiJ7/8Q0gfRLHtHB2BQIxHth
	iQWmBousOwFhcX3JigxVyhbKzmlrkjFB1TDB0IZA=
Received: by mx.zohomail.com with SMTPS id 1784243315163381.4056402935056;
	Thu, 16 Jul 2026 16:08:35 -0700 (PDT)
Message-ID: <3b5092d0-f132-4335-a3a2-b7f9de55d8e9@collabora.com>
Date: Fri, 17 Jul 2026 02:08:30 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: synopsys: hdmirx: add HDMI audio capture
 support
To: Igor Paunovic <royalnet026@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260715200834.8486-1-royalnet026@gmail.com>
 <20260715200834.8486-3-royalnet026@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715200834.8486-3-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

15.07.2026 23:08, Igor Paunovic пишет:
> @@ -2788,6 +3058,16 @@ static void hdmirx_remove(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
>  
> +	/*
> +	 * Clear the streaming flag first so a running worker cannot re-arm
> +	 * itself, then tear down the codec (which stops any active stream)
> +	 * before the final cancel.
> +	 */
> +	WRITE_ONCE(hdmirx_dev->audio_streaming, false);
> +	if (hdmirx_dev->audio_pdev)
> +		platform_device_unregister(hdmirx_dev->audio_pdev);
> +	cancel_delayed_work_sync(&hdmirx_dev->audio_work);
> +

Audio capture should be stopped when the codec removed and
hdmirx_audio_shutdown() stops the audio_work. The v1 was good here,
Sashiko bot should be wrong.

I'd like to see rest of the patches (I2S and etc) to test this patch
before giving ack.

-- 
Best regards,
Dmitry
