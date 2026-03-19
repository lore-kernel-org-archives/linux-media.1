Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC74352927;
	Thu, 19 Mar 2026 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916551; cv=none; b=U5Fh+Ecs6R3yP14kekxUxJxhLQBYSWlrnZyOD8/qQ201x1ELhIgyO3LmCfHfDSIEfmSJGuSgW4FKjxO/xVm+GWwfXu/tCijfsn5v0orpIKkP6kGOBfLU0EyciRHs1opY+MTvuaqMp65douyIoBTFN4vZgiOWcwKBa0KNl590Emw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916551; c=relaxed/simple;
	bh=O8jgJq8Xdsu3nEwyjTfbm8uWUp8mpm0wZXLAEGAsdlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rD/8gvyWoami0MYH64vUSjQdsPjAZcCBbkERM9omDcEUQg93e/DJEZxBVJSN3laIgnzV7s6URBd9TYv43xwYhuuDa9f8zNx4cplh8mXTAVhwOP2npGLqKIJNeRfDEV+AbDjPvMenU1PeImJTI01eoIzbFyAOst9jsGPOffAFkZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3S+4j1o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3S+4j1o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0A6C19424;
	Thu, 19 Mar 2026 10:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773916551;
	bh=O8jgJq8Xdsu3nEwyjTfbm8uWUp8mpm0wZXLAEGAsdlQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e3S+4j1oFLDosNnit343SsQxiLYD6rbxfLv1MQDdVJPBwc029ln8CLSXqh2DTSnqH
	 YbyVvxiLWUw2s3IpI9p9Xw+k3xJJ1gb7RmkhmWBBy4yG+TrA2AMdlY0ufZ9cEp61mI
	 UyKuxgOi8zMHi7Z4dIDmthpvX376APvu25+WERUrahxtHxTW6btLriTsr4tR4u9Q/G
	 j3VDBioNbwDc6+1hR7nwE03lo7v9OsBd4D7vC35sWYm0FCHyfiQyfIovtKXDyUJMcA
	 xIRlD4XQgci1x8pQhB5SYe26jtr3HpiL4CoWuwfQ8rBZ4PZiZZQNbuBsdwqdvR0ijN
	 bJNjx3KwrRHfw==
Message-ID: <f9bb40e1-e13c-4a99-abbc-21a6e4300a52@kernel.org>
Date: Thu, 19 Mar 2026 10:35:43 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] media: iris: Add hardware power on/off ops for
 X1P42100
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260319-enable_iris_on_purwa-v3-0-bf8f3e9a8c9c@oss.qualcomm.com>
 <a74x-g7vb3pG8ckiTEXa_kheGhMTi1lwTzuuh4a1NmwHVuBxD6ztCVtTpBoXr6OSsFuB12g2tIACdMgZJK_knw==@protonmail.internalid>
 <20260319-enable_iris_on_purwa-v3-2-bf8f3e9a8c9c@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260319-enable_iris_on_purwa-v3-2-bf8f3e9a8c9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/03/2026 09:23, Wangao Wang wrote:
> +	dev_err(core->dev, "video hw is power on\n");

What's this ?

Please drop - do you mean dev_dbg() ?

---
bod
