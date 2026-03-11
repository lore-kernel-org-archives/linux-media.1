Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8B131F99A
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 16:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246833; cv=none; b=JSsgHPUWButBFauID+s9Dbf+XgOy6ipsLE88HveE4ANUApiISUniJRmI+W35q36PCrEMOtY9XVfptsaj4gxud/O7OxNi9lK+15OFt5QpqM/RXkPx9uBhf9E3mxrpXbz3t5Hm916I8KfKgRg6OzPzYlihjAkO+L3LNTK+ka6Q5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246833; c=relaxed/simple;
	bh=Q+7PZm8p7Ge5fzOH7T41QuL6H9VCBRsT72Jg0eIxXDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SDfZe5Xe2ZKncdyGJ+aBcXIQi0Ucy6Jx9OEuuFfFEq2s42Ze8JxlIjoTI0ngvr+g4RwbVVSTNcDu87VsmFI2JIqOHcShS+UVqzvOvw8E+BXGcM1MOwPA4L0Vs3eljhm94xUBPSxgvxA63XzFlb/uG+35rZCcXLz3x5Q2+idH0e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qVLYKZtf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qVLYKZtf"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EDAA4B3
	for <linux-media@vger.kernel.org>; Wed, 11 Mar 2026 17:32:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773246762;
	bh=Q+7PZm8p7Ge5fzOH7T41QuL6H9VCBRsT72Jg0eIxXDA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=qVLYKZtfm1l0WYUZSg2muEXxKMTMFJwLrzlJvnjhaiZp9hiZAKkAa7n8PEFMxEmr5
	 ArgjgBCPBvDSW7Z7OelZdCtdtZy5ci7H3+QjjAFIvlc1pT7x0lZcL1NA5Re1wnBtNM
	 iPx4wPIOoCL3JWpLPZbRffFegob/5qBzWAZOwj8A=
Message-ID: <9ab4b172-9f7b-45dd-9233-d5117faaac73@ideasonboard.com>
Date: Wed, 11 Mar 2026 18:33:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,0/3] media: subdev: Add
 v4l2_subdev_get_frame_desc_passthrough and use it
To: linux-media@vger.kernel.org
References: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
 <69b18e17.050a0220.2fc5b1.951f@mx.google.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Language: en-US
In-Reply-To: <69b18e17.050a0220.2fc5b1.951f@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/03/2026 17:45, Patchwork Integration wrote:
> Dear Tomi Valkeinen:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> 
> 
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/94963445/artifacts/report.htm .

I'm having trouble parsing this. Is it a CI issue?

 Tomi

