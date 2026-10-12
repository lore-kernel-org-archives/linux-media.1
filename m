Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E567E450404
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798305; cv=none; b=Oxb8ICixVJuIJgo1SzkMf82pKMDgr97j7igxkynmwIP4WZhQNVv5clXoYQR9lGu6k8RIywgxQADMMantLd05nTDmExgls5NCvOKvOBHSv6LiuKRpAfZxAcKaW89u4zTfe82owG82uW9TxGITPFyhrTSO2X1+hK3TZ9aMVJS37l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798305; c=relaxed/simple;
	bh=a0S/SXx3uqBAWOaL8yJ58h8TUWmNXB/qy5MBhWI0MIc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Zl65Lj0IirrGe+tNUr+aUNm+JoOFeCScUXQKeO907V4bgvcB0/NRMmXboT0fZQCTfId9WA9JQrlvB0Elt0m52ZklX+Phq6Lzts7akBzXnPSzTKc2/PwRmg0IPESFsvKYDHzSysPWGQbD92yqOJ5Q8C72u+u1T9s3d/hKaNZL3J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCuGPeFR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCuGPeFR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1545904f8f.3
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791798302; x=1792403102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CarzP7gxeBeUseEhZ0VNA7nFd0gJ07VgfCqSELfF+II=;
        b=fCuGPeFRz3q1S2R+2Dsemf9pzKfO8TmsYIy3vEtjTN1TVRqXhzdaYSWaPYAETyD3kx
         WcTVGQwrsLFsjFV6fZ5oAXXy+JUdEpzIphRCWuY7APm60TFTpziBdS1c7+YwZWmQ6cnw
         n4ya5GgjYtugYvlcLbJokWMaUzC8R83GkWSJ7AbPrla/2aORf4X/OHb/G5VLlIeXsE9m
         MxiuvT9THiG2f1meLLpOFy+6GwOYBylKFr2f30xuFiQF0gVMHMu/N6UJRGY7MoYh7SMy
         c9Dy+1+MLQol8BWrTZ3dIs8QeLsCWdcRVCJR5/rdryXGorLit2D27b/AMG4dv4JEzRUK
         S4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798302; x=1792403102;
        h=content-transfer-encoding:content-type:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CarzP7gxeBeUseEhZ0VNA7nFd0gJ07VgfCqSELfF+II=;
        b=RbKeLk1rbWruCM3cefcSpzmkhQoqT2CAhiQtjWpk4FnXpafj8ckvmV0/29ZDK+ceRr
         fLm3++oD8zNIHJZsyEXskhvBeVBq9eCs/i9sGr87GDERPI+M7uBbEaExSXZSiICLCD59
         htF2vkrx5/EfkdITdBZadlGiG8iTu+LuuB3k72s0No8tkDPzlcLDzyRNtlUiaGDULut3
         QuvL+mjzeGWBGT9cqOxPl7d1ktN1j1hxvuftPKuTfU3NCg81V2AwmutLmaCfs5I3z+oo
         I4/9ZBkGgMNEDoGdQX+9RvyMrznkh7zSjuXXdeWeITxHXtc70lDbVsXCvzmY36Qp4T+l
         2GNA==
X-Forwarded-Encrypted: i=1; AKwUvBzX7SWwm0mO+JA/Vz5MC0oCso3UyP7upPTJ8ivY7ZQRbpJoWLXmKo7sm+mixPbyfK133xG5n6PQFRtWxA==@vger.kernel.org
X-Gm-Message-State: AFq9FYImvOCuctQ2q1/ypPsdsSVW9BoCFrBvx7gGnC86QOs/2+QZqStM
	s45WL2P8mTMmYcTd2ErGCSSELoPVxA/m6Pn+T2AB5HBn3WQbhNiIW/3e
X-Gm-Gg: AYBFou2wDXN8qkBsPiHZv6vBgLkrNBtCHJ4Brb97AOMUUWC2MdxoZs8z7Tzn3/LiDrh
	x54NliYru0g8xmdinNKjzhsJaxGEYlk+YS0+jVPWZxoOlPIYfCH152CzdApQ3XEliRk+SU2zJbg
	0CGF2vG32cNjWwsTLvvgdlWQL66cxzOoUJUUrj4QUbVdxSlgKhp17tSIy8o5cz2qxqqFz3ijyJf
	+xnRzfyyeX3rckZi8qPacTdbUJpwJcBkbQbG14WQJfXPAhQCfJCVFM60I1MNJcA7l5CVwmnMdQm
	kvgs4saI1IzJxgjkYt+iq6WGJi5F87bGOG/7YbPYvJL7Xc9AZ+/jENxpYrhf8DQPAG5TjRKbDsb
	aq3l/nW6jBYGPelTLtuYw7Z9aGH6V8d3r3lG3pNY62J3XaDtr+GnHmuy6dTORY6aBN68O/FH4XM
	29ibgtE/UUjUQKdMYRhOJfLmL3QsKpbPpAjX+gxth1zRLnVUh/VirwBGEDCX807cUfk6nLRK/2c
	bXWVfcBS1wC1h/FnbfbbanEfJIi3U521EWjpGJUA47fbWluRYkbo5k13A==
X-Received: by 2002:adf:e011:0:20b0:488:57ad:d5c8 with SMTP id ffacd0b85a97d-48dba787c28mr11630129f8f.3.1791798301744;
        Mon, 12 Oct 2026 02:45:01 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:1208:5063:b636:d9b2? ([2a02:8109:8617:d700:1208:5063:b636:d9b2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd574sm19052168f8f.34.2026.10.12.02.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:45:01 -0700 (PDT)
Message-ID: <2634d4f0-b5f0-419b-bdc7-56f8e761f140@gmail.com>
Date: Mon, 12 Oct 2026 11:45:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: laurent.pinchart@ideasonboard.com, guoniu.zhou@oss.nxp.com,
 Frank.li@oss.nxp.com, linux-media@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>
From: Martin Hecht <mhecht73@gmail.com>
Subject: looking for working dtb for imx8mp-evk with one cam
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear all,

I'm struggling currently getting the video pipeline on imx8mp with 
imx8-isi up and running. Something is missing and there is no media 
device visible.

May I ask you for an example of dts/dtsi what is working with any csi2 
sensor in imx8mp e.g. imx8mp-evk?

I have it running but with the old proprietary drivers but I need to 
convert asap for testing with gmsl.

Thank you in advance.

BR Martin
