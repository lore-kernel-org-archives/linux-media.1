Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D23793D4
	for <linux-media@vger.kernel.org>; Sat, 13 Jun 2026 02:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781316242; cv=none; b=MyRp1D9EBt1fM2x0AykX242TuMfRX0Py+hjfoPq242mbx1JaXw5mY09RfwhVT+LMEuTp2BbpM0EwVwncYpA1OIvOtYfCyZixJ+bBm8xuVFbBMOMa5Lg9GPf3LMbdIagFwrs+KGa6z0+X3WKuMnjL35426fw7TmNfeY7dxTCvCDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781316242; c=relaxed/simple;
	bh=sVAcEu8jo7YtMp4kXrsHHazO4c8qMlzVPhgFWdu1rLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eFtA3DsyKKVH/srzhNliL1SIpeFwkoT1UNqQC8QW4tpgf2RqiRVJFyLypZ52W5wTAh5YxVDex8VEZD/A7PUJ6PXg9z61lEIIZcU59eTVv1B4FM0fjwANyhhj4TMfZ12FuJVRg4Hco4CGZ9q5qwREU4Pxqjk7g/UnbVRUBJoWWZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4VTosJ/; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4VTosJ/"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-8422871b42dso986341b3a.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 19:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781316240; x=1781921040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mPoSyMAZC6nuaPbHwX1o/fpMkBKd3DvivicT6BAaRnA=;
        b=M4VTosJ/s1qL7Q149VAuavLpusACpQ3GbeVdB01rIfk4cbXsfd6+JUhfy7j5q1B4Ru
         6rI5m+oqoBKvJRvSm+pAIBfPBI5j1glIUa5f5s/97Y7n/dD1oG8u7LaN/WIH/QcXH2SI
         AP2kuLaVdzngyLQ0lDn7wHKqdwB2d2USWa+G7rU+1aJNiSiuctLLUQsgvoflWGV3AqYE
         QvZSyhVTlt3J/LZZuYxVS+1v0Kgn7ybXqb4F9+XrjSrg50w2xICpmdEcl7iUjKnn7dc+
         y3pvFdSvk25Lg9oUMTPew6v/ONmRaNLr/87XV44BegTBtthJkS5lvu02yqwIIeRFWgLg
         39xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781316240; x=1781921040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPoSyMAZC6nuaPbHwX1o/fpMkBKd3DvivicT6BAaRnA=;
        b=hJh9AqoxZbcySLLFRkoLhyizRi6Sj+tG0TY3Q/R21dwO3ztQ5DhlgGNwACbnJFMaus
         CcEHfSHpX6HEZVCT0l7gJk6Oh2tJaoO1U2MBGr1VxL0G2eGg6vX0/VYztR2pMY6H9Cps
         MsNZl7kwoCXr7xdfvcVGBbAnSNUHIsVXWl97ir+qpLloKCDWrWaS6tJRVgAztz/NxD87
         KNQp/EFCW6/0IjS89OBIIyoAw9o6Krnd0Rm5TvieG5GFd+R8hyB42M/u88eBGYQzmj8K
         ZR5g0Sl9NS9TieEpzh5H6kyLYPNEf7zpKCE+fj/reK9T3ymObmmyIu+uiNDOCzoyBRdb
         drZg==
X-Forwarded-Encrypted: i=1; AFNElJ9BbX9jgxHc15gYz89hGpHiKdJ2BGCiFmal04MCtIAWU0Pmxx1AACJwNqT6YRWnOK31RNmMBxWjRXKPVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKfWiIiq+aWd9Gn+u5m3JUyDlNERUWvZa8wZf+VWJXt7BWZfOU
	x5sysxKIhRqfuwVqjiE3LlY4TNOKBzHorn3OuV0/ksaMWVvX7KTf3Xwl
X-Gm-Gg: Acq92OH45ipnw/ewh346igOB+5U0Y2Ed3U+rLd/IKS7vzkZ9zzdL0ZVWyFSyYQswumr
	aKYrnwnPy0/ayvJ4VBrzBXPRfjCTp3X1C3R6V2lTTWWV0BWW5LvHOm1fIGHGOY9B1xk/CidpFQr
	h1tO0YmvpYBTxzOhDW/Zi/TDaMjlzNvTDxSHluVhB63yz8FZ41JedR1F4OQhpaHzcA+YWBZfuZA
	lcYw6xVB8pbb9P2981J2/67dEZEGcIPvsn1yp1+/sb98um4kaPMgFtzCTUtnYpL2Z+tyPC0tJRr
	DYMM8EqjQlXpje7meGcDsYjXhKQ8ieeEudzDuP2XvqAGBO606DnhdDTiScy+g2cLMQiuC8ng8ny
	uzbrUcTSfwjXbEVCs9LFnGQ1OjeN/xUhfmiw0fW3Zp11SbP1f/8vtYnSg+s+2AuJvlHdKAUmJQY
	HuNOMTHDw0Z8QHgBzP
X-Received: by 2002:a05:6a00:1d9b:b0:842:6c02:2fa4 with SMTP id d2e1a72fcca58-8434cd42d57mr5864692b3a.14.1781316239902;
        Fri, 12 Jun 2026 19:03:59 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:45::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434afc8a5bsm3623847b3a.33.2026.06.12.19.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:03:59 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:03:34 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Donald Hunter <donald.hunter@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org, sdf@fomichev.me, 
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com, matttbe@kernel.org, 
	skhawaja@google.com, dw@davidwei.uk, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 3/4] selftests/net: ncdevmem: add -b option
 to set rx-buf-size on bind
Message-ID: <aiy6bh2IAHDtBX2L@devvm7509.cco0.facebook.com>
References: <20260612-tcpdm-large-niovs-v3-0-a3b693e76fcb@meta.com>
 <20260612-tcpdm-large-niovs-v3-3-a3b693e76fcb@meta.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260612-tcpdm-large-niovs-v3-3-a3b693e76fcb@meta.com>

On 06/12, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add -b <bytes> to request a non-default niov size via
> NETDEV_A_DMABUF_RX_BUF_SIZE. When the value exceeds PAGE_SIZE,
> udmabuf_alloc() switches to an MFD_HUGETLB-backed memfd so each 2 MB
> hugepage produces one naturally-aligned sg entry.
> 
> Reject values > 2 MB up front: MFD_HUGETLB + udmabuf can only guarantee
> 2 MB per sg entry (one hugepage), so a larger rx_buf_size would fail the
> per-sg length/alignment check.
> 
> Add CONFIG_HUGETLBFS=y to drivers/net/hw/config so the new path is
> reachable in the CI kernels built for these tests.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
