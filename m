Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136983C0A1B
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 09:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142996; cv=none; b=ev8hVzpZMiFExnulcvbxbu4lbApyv1uwds7tdP+kPUNFhBEkX7KKYTERzqqoJu4uuV+skC+ORig+zBMzc8UorkljsvFB5GKW/bN8EbAw8LMv4JehGls1ZiRN9V/0T0ld1w30bjBmREwgB1OUxlwmBiwstz2U5yzol24XIAVgGbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142996; c=relaxed/simple;
	bh=kTDH5S4ysmo2sFaieTu2UjAmwNg8TwOXckYezAXHhh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jZHaVoUkR5HeGxl3G+Hp5YsrgG3D9NUNA2QkPfXnjV/cK6kDWdvAxHp+iKaykHeZHk6QcH+sSRnfzxicB/1lxi8e5zxpabZoG9xiitp9Y59fYkgru7BqGn4Es+BcR2tkLGUWv5nvnyjDMHbCViJR2Hibxn0bDq4ZIq61HUkHniw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=b3GviCnP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="b3GviCnP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so16878105e9.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1785142993; x=1785747793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edzEg2J/oLqzfs9TMR6atfH/lM7LkpfPbZs2uM8pJC4=;
        b=b3GviCnPq9i1aD7Y5y7bzKgg6il0W8m9XaPJQ4I12+i4aM5U6hRMuNxR65SpN7uUHQ
         PWnxjTKHglMT3cV+qGust9WX/AL2ARb8BKzITWhH8Vh121IvbLyE3dAKYnDNm9GGZ1pe
         6hJ5U102tnuCTKYGutx5K+IuXtT/NE+AL8XrT0tWppE8Z0LndTSrSPMSw3QrO5E3CDOH
         Ypzn5IVWR0x3oRtAyqN2N2ESOCYQH0oi8Ggm1mTvLI7vtBxBg0w2FqiCifuHZni5/e57
         BT227eFMxD0Uq4pu2DXaipPgvWnq23gJCyk2ERmhKXNtOcpYOSKuQyH6cK2zDOMIDjI+
         n0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785142993; x=1785747793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edzEg2J/oLqzfs9TMR6atfH/lM7LkpfPbZs2uM8pJC4=;
        b=KhpL+nzQZ8yPF1f/PqH5VE5XI4+L+dfCou4yOakZ9nttLHYLLnlr8D/IqIvKPBzgFn
         eC+9fVeFdDdMVFpO94TksxTJ9AzK7L3UOUdE57MZA8aiH0p8MzcaKB25j1F9eC5L6+tA
         7nHtfaz3pZUigRVC9kScH/EEVMN/DeiK5L500Wu0+WTPpICosEbonPWxsynUNO3SnKz8
         Kz8hfHK83Z91D/na/ilx6q6Mg6m7BL58/H+kMALCIpv0Kjlzk5krvUCkSgMKYA9n8nIJ
         4tKsfjXY/6eyzzKn9RgiIWsBep1IcXhRd9aHoQ2uanoWJUnwH+lokD9mLqU0sXDIj8Tz
         gekw==
X-Forwarded-Encrypted: i=1; AHgh+RobL+SPJu4TMXwo8lCSM3u6EIYnkb58/ugeCrigVnKLrv82zRN9/SuG7TV8fJb/wor7Ky/nQlHbwNJbSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzel9zE6JB4Qq2A6Ld51cs6y3D3IAeDrPhORtArUkZ21Q5nX+d4
	Y+tqh1uywyaGBy1zX7ZidrZVf6FifinwkMIj2hze/GcclulpPgVJwBXQpDfl1IyXPls=
X-Gm-Gg: AR+sD13tGzD2O68smndS9Xx40ReDimupmz+mX8E8+n/zZrF1v8BmCBitSM/w/OrPh3y
	+8XDrL27fkvjA5eD+kxCJCZcDpP7aAT4z3r8CTNmOH23qy6PPp/iVJGGqloZAtSFH8FrS8U/4Ss
	UHEabEk8+Km64TQ2P/a/wG96rFBz5M5NSaPyYpgUQ8Or0Rwqe8Csz8XvhyKqMUzB6aalXGqHFgK
	zVqkcSGKkQ0dm5IWndSRbtVfsblhkaWulxx9012ixvfhwbcgwefWUCRV4/du7cZ0lP0OlD4fRAz
	OJQjMyth+uBRUNMBC9v5xbrHB8QSpHTAP16doJSeW1UPKRSvX882+nqa5Vrl/z+qTNRjTK8gzSR
	+zXwi1q2cU/qxs3u2yXriDybYlP3FGTlagHKk3mdhanG49Cil0SCMzjQQyKzRE9cv2uvFlAF24w
	==
X-Received: by 2002:a05:600c:3113:b0:493:c8f7:3631 with SMTP id 5b1f17b1804b1-496b570dacdmr90046155e9.22.1785142992910;
        Mon, 27 Jul 2026 02:03:12 -0700 (PDT)
Received: from localhost ([109.160.73.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ed5f93sm333309535e9.1.2026.07.27.02.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:03:11 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:03:06 +0300
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	linux-kselftest@vger.kernel.org, sdf@fomichev.me,
	daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org,
	skhawaja@google.com, dw@davidwei.uk, Joe Damato <joe@dama.to>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 2/3] selftests/net: ncdevmem: add -b option
 to set rx-page-size on bind
Message-ID: <amceyvCsHb_B1-Of@penguin>
References: <20260724-tcpdm-large-niovs-v6-0-7975f62cdfbb@meta.com>
 <20260724-tcpdm-large-niovs-v6-2-7975f62cdfbb@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-tcpdm-large-niovs-v6-2-7975f62cdfbb@meta.com>

On Fri, Jul 24, 2026 at 02:21:16PM -0700, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add -b <bytes> to request a non-default niov size via
> NETDEV_A_DMABUF_RX_PAGE_SIZE. When the value exceeds PAGE_SIZE,
> udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> hugepage produces one naturally-aligned sg entry.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  tools/testing/selftests/drivers/net/hw/ncdevmem.c | 36 +++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)
> 
 
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
