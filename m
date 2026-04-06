Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527FA2EAD15;
	Mon,  6 Apr 2026 15:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489862; cv=none; b=Zf7ieuvZE4AescmxzPN1aHDh8L3AclqbVAd4Jeb8PqkEFulgZ/BSz73zARRd3NzhTU/vuPhTLodUL4cKlXPkrtt53JDYCxRgA5AXHW2AT10+sABQIzyBunMCYSQvH8vx/I3DbUMya+sBiV/yBvKn+0MLDm9JpYROdDKclgUz1ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489862; c=relaxed/simple;
	bh=trgx0SrQvYQd2nngBh4hc3KHxII4z5j1juLG5NRASmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iu6+Fz+MnF/qbhxBfA0q3i/fs6Mn5ME8O2pQERkBPNI/AXtiwQBkMZQsjDo59Yc+lepQHWQ/9U+tTXxNfKMoC92bmHxTPwkqSKC05LdMvJgB6tIZYse/kosrF0wh7DmdbkIM8mNl7juhxxKgQwzFBmv05ODcvNx17TJmwRJennI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GR14fQSx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GR14fQSx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD41C4CEF7;
	Mon,  6 Apr 2026 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489861;
	bh=trgx0SrQvYQd2nngBh4hc3KHxII4z5j1juLG5NRASmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GR14fQSxvsIM15o7/6sL9XZrVLRdS8fO03y8ZLCk447TwI/yk2AVpPRhsv4V+jO4n
	 +Bdmk8NLOqPs4swI9ZO4mgrFhvAkFjw1oTFrt6zkrjt1czrPQEsZmX5ZfR4bLsKWDp
	 LTo1MFB9rtAtkPy6b11VNoGVBFzxWbeyFuTDnWjsbPzBvYaRF2ZrhIWV/ZemTGwgFp
	 F2eeaFbmM+sTWlK6kLTiB8UdBDGFIJbuwf3apyxiARAFWFeX24A8z7Oz+0ad8LC0Wf
	 2Rb5k2eYt5r30QsWqd3HNI+mJEAd3f5NFwcmA/6wwu0QfGwkP00vcXbnkRp811O8L2
	 3VeYUAZtI+cpg==
Message-ID: <a310c4bc-0ebe-4caf-b784-e438c9460487@kernel.org>
Date: Mon, 6 Apr 2026 16:37:37 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org>
 <20260326-x1e-csi2-phy-v5-2-0c0fc7f5c01b@linaro.org>
 <4A_In93EaOJI3pe3dV74CQmAmTe8rJkOYlMdGodO2l8jXQ6mPJdmnQ3VpfHRoduYhZdm0PpwNjm9sZHu-vjNug==@protonmail.internalid>
 <qrzaihfpujlhqeukp7wioqrqjbpih65smmieliixavzlev6las@odmnpbuc3wrm>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <qrzaihfpujlhqeukp7wioqrqjbpih65smmieliixavzlev6las@odmnpbuc3wrm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/04/2026 15:28, Abel Vesa wrote:
>> +
>> +	for (i = 0; i < num_pds; i++) {
>> +		csi2phy->pds[i] = dev_pm_domain_attach_by_name(dev,
>> +							       csi2phy->soc_cfg->genpd_names[i]);
> You need to do detach these on error, otherwise you get:
> 
>   sysfs: cannot create duplicate filename '/devices/genpd:0:acec000.phy'
>   CPU: 1 UID: 0 PID: 93 Comm: kworker/u49:2 Not tainted 7.0.0-rc6-00062-gd691cf9ea708 #12 PREEMPT
>   Hardware name: Dell Inc. XPS 13 9345/05H2K4, BIOS 2.11.0 09/21/2025
>   Workqueue: events_unbound deferred_probe_work_func

Yeah I noticed that myself, thanks for posting.

---
bod
