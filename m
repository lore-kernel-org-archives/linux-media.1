Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F3437DEA1
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 21:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784927069; cv=none; b=T1tctCP8Woy5h7YuZxCn3TtbkZ6c+7kt1UEtTLZ6QiJ99pyudZxDJWQhSY7v5T9ovE7blIrr45LkN1y1cGdHZ8Gg0faDa5yZR+CbjcXHQHq0JpmUYYv+dcOraGrJwAV2FsFkZWiVDViwY6Gk46oAjJQHX0E24WHP0W70cf/Wx8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784927069; c=relaxed/simple;
	bh=2kfGFMMn1SkkcMGUQ+/A+N3nU9GKzTtSzZNGjnbV8UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0YOLPLKLvnPX52KzJ1aUmd49YEhS1sz6Z3R4bNnUCdIWX3BEM5t/zeEg4GBvHLAvWOd+W0HadZwP731CSxFaI7HSc8iuw9zwHo7Y5AvFBE+8PcXg3TW0u7H5y6PTd5BRZWBvnN/NMDv8EzWt20Meozniz05nm4Z3OrG10Vuw5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPxcD9Qr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPxcD9Qr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cace91f112so11103785ad.0
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 14:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784927067; x=1785531867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VwUsmXLvkQOCrPIfr7szp1HeyxYyQEY+UzEyT+qGU7E=;
        b=VPxcD9Qrx4AknY0dVtRhpkrEgCpep9DrtNxIVk737TIXmegil0DLLstVRFtVj5dD6Z
         sMHs0/uLM0y0NcUvSl8YofUtmwdjytpIM+os2GUFIROoolH81tnKU0IBCsWi7KF9tReW
         Qp0ZbjPxWGM56BJQ8ajVbRbQC3dUE3vGoHWjc1OaFwXZAxdljORWOYizemLUW187A2Vj
         fc7X0sU5WkF+CpVcI8LF0aGqXkKEoPXhCjnYSOVuT/V7axcHUxGaEqQuDHoxzP36juAF
         rIjY7L+RhHYbPYypU7p55U9FeXse5FH+id8tU5b5kj25ZspbClyG6hJ8DhNxo1iUqBTv
         6ExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784927067; x=1785531867;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VwUsmXLvkQOCrPIfr7szp1HeyxYyQEY+UzEyT+qGU7E=;
        b=sAXNFz1TngZ541yJo0Za7lcnNxSFMSuYExsFXnNFfb0ZPq+hpWXIyc7ZXRjJ3BJEU5
         PmeLI7Ba9HMu+rYfGppgAh9rDAzMa6gB+VpNvrhWV8xqfK0UWXp8f+oeRYKjRZ92YrPT
         uafnDU7iHECUvpb0TTYATA+JUQDc51LSSZ5PieX1K1YnEpNuCmVERXONXHn5s5Db/pmb
         bbqYrlRrW82XNnEfxjXkx1Lcy6YCq6ygNuqJzKWAJwIMxFMh7pTzW9EHH7dXeSY5qKwa
         eX8mXVmf93kR6FAW+TqN9R43/WtLQRMb/PiOeFY1k0JxEcI1fO/l7udoKs1EuDztDH4v
         Bnag==
X-Forwarded-Encrypted: i=1; AHgh+RpPMBzrX7J4sPLIsvqCEGJTYBTG2hNGzO15gvMgghzkQGsmKpFnGtsu707g3U2qhUonJU8mSm/gXXk2xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgyhVLG8fD3MUwZusyG0PkUVANTR5sWbBJmyxGnvi0rmROGwNd
	g7J8kElFYeCCgThdIpP8AKSiHESqu9LIur2erWgT50ikihpsqaOMirtr
X-Gm-Gg: AR+sD13CabP2qDALqyoWw0jf5cmy863QRPfFCkIh3EhOZM/zVuhpEN/fv4nTcYRdu+7
	wrx69K2aXUULnpBclHPHXqrVYM3DHub2b/CDX+E6xe9B91wykO3JHaOpx+i8prcfcUpp+nfDl0t
	VO+KdvMeygRTOCPy/JigEtYNW+KhrOZM8F+f60QCzUkF+KpsxQDkAZAjUUor7NDvfQY9rYte62m
	8v8ii+b5XZrklLyNxBydD+IzTgXyIGFMAgWbn8N0fN5rBFjwh57o8uM2Ta6gSp7cqPhiIXRBeA3
	R7/mT82/MIqPR7r/1PnyjZuVrnkOALxC8Byrufz5M1DQcufL0BwfpT7QHTUeQxSOkSr/eiPmL3W
	xmzFPsbyhhaR9ZzfMghxxPG6CMAxq+ph/VLpMHTYvcgv8OmW4s2oUyUr+CkAAgBPD8vd8u8qFiY
	/EqQk8GUPVw9kSm7mhVqA6x+CRwU4IGTBz7aNj19hkNqX3P9mcR0COATURpKvwPWVMLxdwupvuf
	SN54XCn0h8PjXwCukQ=
X-Received: by 2002:a17:903:2b0d:b0:2ca:d975:5bbd with SMTP id d9443c01a7336-2cfde7c4b2bmr712645ad.20.1784927067004;
        Fri, 24 Jul 2026 14:04:27 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:48::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e2b8esm257875ad.31.2026.07.24.14.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 14:04:26 -0700 (PDT)
Date: Fri, 24 Jul 2026 14:04:24 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Donald Hunter <donald.hunter@gmail.com>,
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
	razor@blackwall.org, daniel@iogearbox.net, almasrymina@google.com,
	matttbe@kernel.org, skhawaja@google.com, dw@davidwei.uk,
	Joe Damato <joe@dama.to>, Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v5 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <amPTWGX/3LHepYR3@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
 <20260721110903.34840531@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721110903.34840531@kernel.org>

On Tue, Jul 21, 2026 at 11:09:03AM -0700, Jakub Kicinski wrote:
> On Wed, 08 Jul 2026 15:55:06 -0700 Bobby Eshleman wrote:
> > +@ksft_disruptive
> > +def check_rx_large_niov(cfg) -> None:
> > +    """Run the devmem RX test with rx-buf-size = 16 KiB."""
> > +    run_rx_large_niov(cfg)
> 
> Any idea why the devmem tests sprinkle disruptive everywhere?
> Disruptive means we take the link down, I don't think this test 
> does that.

Talked to Stan and he mentioned the original idea was not necessarily
just for link down, but any test that could be considered disruptive to
other tests, with the idea to eventually introduce some scheduling
(postpone disruptive until the end).

If we can get common agreement on its meaning, maybe I could submit
something into the documentation and update where its misused?

I'll drop it from this patch since it doesn't bring down the link (and
seemingly no worries about check_rx_hds() tests not having it).

Best,
Bobby
