Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF213FD14D;
	Tue, 24 Mar 2026 13:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360098; cv=none; b=YvnokDwYhqyXIaUipnEEIb1eVRXgW/al3XmztIUbBd7W83gwpNtEdEANctZuOArAz2nBF96JOR0dDfzcT8vy+LrU1n+m/AourdVxJMfsZ9WDIQLsgwYhA6EO+kJJ49UGrX5/8HmXPY5pC8+Knx3RzieElZM5XzmBB6C9BpXC9LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360098; c=relaxed/simple;
	bh=n1JRsBlE9/aR6gzdid1yfnIVVfJx7S73WcWM60ioxIg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=s6yFBnsjDallofvIwaXpOcAfRxJBHQBwfcsagrpO8NBP6kvNGJiqoKp0wAMBYaspJUuxjpXzBzrodYrpAt9zAfFD1KWtoXoG6sISquendzWemBlxZbD4ij4wrQsWEWrw1Z+wN8llPfin/f4HUMWzZoNkH8PJA1TCVfDuIvuPo1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzKhep9G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzKhep9G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A07C2BCB3;
	Tue, 24 Mar 2026 13:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360098;
	bh=n1JRsBlE9/aR6gzdid1yfnIVVfJx7S73WcWM60ioxIg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=BzKhep9G04YVvdH88KunL1y0dwXTbvzuaFH0fxUxX7whG1IHI+1VpioZsHVVQJrJk
	 MmAK4N4mbqODaG7rnOwxA73Bj+7ANIYM4hjR2/tFlcboiWTBOmQCLl0Za44defE/gw
	 ZkNTitV3LahJz9gGf4jWqYAR9PXiVD2kAjNzU4Vjs+PSrf+kX+NKmyvxkBJnonVWWf
	 YPY/r4hVmRtSCUvINHtaTgby9iMQ+XPv5FrcsK0Hs0ZudFqwesfsDr9QeldqzrdHyv
	 C2H7fEFwh+YlcYV/h+SQ8C5uZ97OJt+pk5tLA1NETaHz4066tLcwMIaUU/fJ9Tipwv
	 2qUzuuo2jNm5Q==
Message-ID: <63e50918-60d3-4a01-b28d-77c8580f1260@kernel.org>
Date: Tue, 24 Mar 2026 14:48:15 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v12] media: Add t4ka3 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Kate Hsuan <hpa@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>
References: <20260323071647.38086-1-hpa@redhat.com>
 <0532e7b1-b3c5-4bb3-80e4-76db00c385ea@kernel.org>
 <acKREpGPr1J_1Oaj@kekkonen.localdomain>
Content-Language: en-US, nl
In-Reply-To: <acKREpGPr1J_1Oaj@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2026 14:26, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Mar 24, 2026 at 02:17:38PM +0100, Hans Verkuil wrote:
>> I'm missing an entry for the MAINTAINERS file.
> 
> Thanks for noticing. I already picked this and it's in a PR... there are a
> few other (minor) remaining matters, too, which I asked Kate to address on
> a follow-up patch. Would it be ok to address these at the same time, after
> the driver is merged?
> 

I prefer to have the MAINTAINERS entry before I merge this driver. Other
minor matters are fine for a follow-up patch, but a new driver shouldn't
be merged without the corresponding MAINTAINERS entry.

If Kate can post a patch for that entry tomorrow, and you Ack it, then I can just
add it to the PR.

Regards,

	Hans
