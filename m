Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888574B3366
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642652; cv=none; b=Bn5IXn/7S7WoACGuI5JgDqF+ZOFV6/3KDO8UdHh1cHEdVTC/4XPv4YdO2GykSmjM+Z/e/xMsqqXJcIu4z8anCzugKrpzuU920a6hL5erQKzqZy+J3MVW2lIouB2afsY7kTiZDhfXSHV9Lmswk066uOp/6PpRVntRwDGiovqKdPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642652; c=relaxed/simple;
	bh=SLG5jIYY5Mfhc0e5xwYoXDB7kT5Wa0rl9W4bGFHxePU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sr8zyc24ZcF47kElZCUuQsv15Y5Fb97pTcmiZVUe34t6SuOkObisyV31Gyq6WIdO7OYIuU0qO4nTfE6g5LHbhUEszMbxzK0QYfwNnBhU2ejUGCKEDRINmwAWO2FyW2P5jSHKyYRKsI3mOGR83PXJAnu5TNFL5zkdgzaAHKBtYds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6GuEWXr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6GuEWXr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2251F000FF;
	Thu, 17 Sep 2026 10:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789642642;
	bh=gDsNcuezFM8jpRlcCe5yAnSoEa4wL+5kDXqqpeRfy28=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=h6GuEWXrQL1YODjv2yvsx2c78pth8wkf3oN8niNL7Iv2JNADFDNBHi55UGvX/JtZ3
	 uYfJzDu7yY2EzWSgNez4QyI5EEtYN8YWof1jBeO/fC47R+MH1pk8hDHK75EfuoEtow
	 uBzL9ZpzUYQRtRXR6FgnSWfyLtB+N6tQ9UlFYV/jPrC7M1oFexYza59wKVw+kmG5pH
	 jKP3OPfgB3cT6r7KfZOQwFPxRgfb0lVX7UWWv2tIyW38dkg2LluZDbVzfe/YBOuNs4
	 fY/rLnHlKzlljxYhRefiw93RsNgfcQ/kmfnsNu4v5MTD17y7Bk7lr8Tcf5RV+al3HE
	 Rwzw3HVGIkQOQ==
Message-ID: <d4dea739-9803-444b-ab6f-346eaa511559@kernel.org>
Date: Thu, 17 Sep 2026 11:57:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/6] media: qcom: camss: Add support for Nord CAMSS
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <6aa92fc5.2eca3aba.387881.68f4@mx.google.com>
 <UI2I4KRjCFt-BlTZh2zvw-TUHyLxtAk7EUQKiQVBnNDyNRdkH93Fb6ORrhrno3ljiR0940VHGO8fGUyxj_JRhA==@protonmail.internalid>
 <c9925024-b293-4349-9105-45ae8aeef75f@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <c9925024-b293-4349-9105-45ae8aeef75f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/09/2026 03:57, Wenmeng Liu wrote:
>> Please fix your series, and upload a new version. If you have a patchwork
>> account, do not forget to mark the current series as Superseded.
>>
>> For more details, check the full report at:
>> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/ 
>> jobs/110294816/artifacts/report.htm .
>>
>>
>>
>> Best regards, and Happy Hacking!
>> Media CI robot on behalf of the linux-media community.
>>
>> ---
>> Check the latest rules for contributing your patches at:
>> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>>
>> If you believe that the CI is wrong, kindly open an issue at
>> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
>> to this message.
> Not a issue, linux-next branch already have this file.
> 
> Thanks,
> Wenmeng

Point the machines and the people to the series you depends on

- Depends-on: 
https://lore.kernel.org/r/20260903-x1e-csi2-phy-v17-0-26606fa9a039@linaro.org

---
bod
