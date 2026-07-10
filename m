Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A1F39A802;
	Fri, 10 Jul 2026 20:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716199; cv=pass; b=XB22F8194QjOwJvRWJiiqBXbioIoRYwx+r1wiqh+Z16eHQJH0Q9a9CoKPVJEN7GcYUSdAhNmf+N1g466d+3oUf4ahZs2VRJIJVowdXy+tuyuqv4jNLTb51KMo5U2fbt7tmfx2Z69iVCqsJ9+UQ6K4nOhQYw+mY+ScojFWIrXCEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716199; c=relaxed/simple;
	bh=bqgKERwzP8aovhkVstmX01bXiK0fwm6fPsZM8l57Tlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UyL42QTzbSRJlGJBVnrweL5KAHJ3/FawylY9VBmiYjHKpVY89W4RIQoetNRMLXXyjFmIV2kog5NjwmJrfOqWOlU1fc0tdfHLH04BuiGpTS1WkdidpOkgRp7MihUQ4E8+6w0KAZYbzpQYY9qTMVKe+cK5/9GMPq6LOloKf8Qq6OU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b=I9JNKRuX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=michael.riesch@collabora.com header.b="I9JNKRuX"
ARC-Seal: i=1; a=rsa-sha256; t=1783716177; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZyUydZzLCJqQ8wHcsSMHJlKTS8z/av6o2hGJJdBy8M1k5t9U7f0WFGpaIroEhcsIePuq8C7FHzGNBL0Ii88bns9s9EdgQKTHBo8WE8Fr+eRTkbrZpytgsQ0JhMa9vnViAC85rpb1YaiazTbAJ95Jwm5daANU6YKk66qlpO/Mxek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783716177; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bpn2IgbKGrTggO+5MYIlxTrWJGnctnmaJp03+CTcNbQ=; 
	b=MMCjpRRyJxtIpWTstuncaP6v+wBiS/7282bPwZu/2MP1cdBfLadH5jrWGthdUuQ9DuZrJLhrMmJiBio4lgrL6/w/hHAtTN7epLc4Qb5DJ9qem8mQ7D3VPoA9lNeKEtYkz9QIVEmsLfmalXAulHwQbgGaG3fjvTd0eiYlW+bKU7Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783716177;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bpn2IgbKGrTggO+5MYIlxTrWJGnctnmaJp03+CTcNbQ=;
	b=I9JNKRuXOnNk4XkmPx9tXSx/ngxfTyoLiiRCSqtZR2WaTQLmD/Wa6bXMuvL7Mrqs
	i4KHNLDNZa30uB99Q1MFbaC882rFxFWJ0J9sObXLuMKm7vdpkPwTnZEOyK4xKnxSQdh
	RSd9na5LYg7gknWD+0V5MoTYSIgwHruYTGzjp4UM=
Received: by mx.zohomail.com with SMTPS id 1783716174951831.1292117639873;
	Fri, 10 Jul 2026 13:42:54 -0700 (PDT)
Message-ID: <a6a32617-f3c9-4cf2-b020-daecf7ec18f1@collabora.com>
Date: Fri, 10 Jul 2026 22:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] media: mc: Implement shared media graph
To: Paul Elder <paul.elder@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 laurent.pinchart@ideasonboard.com
Cc: xuhf@rock-chips.com, stefan.klug@ideasonboard.com,
 dan.scally@ideasonboard.com, jacopo.mondi@ideasonboard.com,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 hverkuil+cisco@kernel.org, nicolas.dufresne@collabora.com,
 ribalda@chromium.org, sakari.ailus@linux.intel.com
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
 <20260619052637.1110672-2-paul.elder@ideasonboard.com>
 <178229758404.3075020.12553514371020830845@ping.linuxembedded.co.uk>
 <178237578321.292172.5229006087283359591@neptunite.rasen.tech>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <178237578321.292172.5229006087283359591@neptunite.rasen.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Paul,

On 6/25/26 10:23, Paul Elder wrote:
> [...]
>>> +// TODO figure out locking for when multiple drivers touch the media graph;
>>> +// maybe macros for shared versions?
>>
>> Do you mean for when drivers are trying to change link state directly?
> 
> I meant for all the operations that act on media device. I'm not sure what
> there is because I didn't really find anything significant, and I found some
> action point from some meeting notes somewhere that said "deprecate media_ops"
> (not assigned to me) so...

Oh yes, for some reason this ball ended up in our side of the field. But
actually I think the media_ops are not much of an issue, as you don't
set them when you create the shared media device. Problem solved, right?

> If there aren't any then it's a non-issue, but if there are then I was
> wondering if we need to return the shared media device to the driver (as
> opposed to a non-shared regular media device) and use shared versions of media
> device functions that have locking.

+1
I would recommend that just to be on the safe side. And I think I would
make the shared media device an opaque pointer to make sure that there
won't be any monkey business.

Thanks and best regards,
Michael

> 
>>
>>> +struct media_device_shared {
>>> +       struct media_device mdev;
>>> +       struct list_head members;
>>> +       struct list_head links;
>>> +
>>> +       struct list_head list;
>>> +       struct kref refcount;
>>> +
>>> +       struct device *removed_device;
>>> +};
>>> +[...]
