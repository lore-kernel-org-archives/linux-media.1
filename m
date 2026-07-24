Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BB73E3D89
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 22:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784931223; cv=none; b=dY5QjyyZauB6rHrNyjh4k0mHd+2xCNlRgitv8FckRM3pmJPQTfTPTe6Aso0ktu9cWksjEG0xo+/gSA9vaGnCsc/c+0szSyDJGW6EXUGGsvqtBh0/wDowutJfbkxS6eunjbPDCPJB/C/s2LQaji573+EFChZlhn2QWuw/F6oK6Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784931223; c=relaxed/simple;
	bh=pMKpKubFx9kEgDbednVOQ47WZM90zaPgp5ftx3GTfMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIx7ou78pdie0IpI/es0Jw9Vd8T+nj82oGqSGawzMWxYfUk20mi+T6pX170YYWiAdV6eD4rUIct6oajX+vaN8aqHS+Y+BAiX/0gMTW7eKzaC6cs93Wd+cMRXSQFEinozRCZtjrnolFD6jUQPSzUr8mZhsczfEG2GqtKEramd8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/uu45oP; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/uu45oP"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so766836b3a.1
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 15:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784931222; x=1785536022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z2sozbBNB86MDdVFB0IAFAWmkqaPuc9KNZQmr6UjhYE=;
        b=N/uu45oPkIawysFLAkQk6ltaKaCSqLTnkBhZBgm/UfB4EtlWngLPRwQbPVc4UdH6QS
         NW4ozGhV1D1K2ggsNsXTCSQ9NLjWIhQXIh0uyGoSVuHWS76jTo8jWsTug5As4xCxuJ07
         lFjT1j5tKoaIr9Iasx5scXnqPuDFkqjDVB/2o642YFIEPDjV/HDjnMKjHD52WxXIBxIP
         owgmo1iBP+NHHWXAVrvKMzVGDxW1IRwHWKyjginBqM4FESBmSV5JmEYdVkNfDN11hCUN
         fiy1QQeaT+5hlnweTVfEtxiMERK54bc9gz+Kymb2EQ1LSwRjp4L83nxkUn4q9VlgTXcB
         s3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784931222; x=1785536022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2sozbBNB86MDdVFB0IAFAWmkqaPuc9KNZQmr6UjhYE=;
        b=dO20BwSR2LsRFD/xQAJ3EPvoeuKz+9WR2KDIpRCTVpjn7EtMfMxhbgYbwlGkl8gnXV
         wW6gFuo/O2YmYPVAh4DjVJs+MmS6I4bDd9f+KdMWz9CM4dVPJDKUw6hSp4CPYclhwj0+
         4fHXBEoUhD3sfCjQw7Ofu+FLASIuN0RtOLMN+pEEdUtCm4JbCQN46eTeEmYICjsuW0lp
         fo/8aLa4i4Tw+rxo+FaBDL3moqoDqf5mKI0wDlZ7E+bEJORZwnF12XmuWe/GuSMPGf3b
         1PBIt8GyY2fmS67gl9hhQoackUxnoWhoa0qlT/QRs2zpRphmlXRuHZxFfjd8BYdV7ipd
         asuA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0oer9Y2bp2gfAKhQzShuJ9r3PTxkvPCUcicXmevuflVR1SWpYT+JfPQGV4CkX3FgJY3+6vYxsucJ1hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziBBwe5T7HBSGQ/eM78zrpKELnT5YVXyWUaU/Uzmz8ZkHhyzWR
	Na7fejuxLBm8Ojt5uMJyI94j8GeoH98/Ycb2o2X7jlnZThjMHdEGzOK+
X-Gm-Gg: AR+sD10WIAIG8zr6lbE4n9k+TffoSOLnuD7UR/8N8Tz1y2quzsxyGtgv0z3bfY/PT76
	0k25Zw55og+ifCtuhZv2XvvV4EfuN9/YG95OfaQsLCy5aHDa4aICmrR4oL0bGElALNxpACDtzTG
	CvG01z9qikW77+JrfmP4sEbJhNu6HGefUw2Js+ANgpXTFnYa2nPQIjuR8YH1VWKnmbj0kqKHbth
	DTig8JcwTYtz+1LdsYdr8RD9K3dw3YvttGLRKuwuzXXwE4X2nFWyzZ8l3MLO09ouDqAw+Ck3jiS
	2/f52MbkXkkqbXPU8tHK7JE2GEL8yzPh2aCjcYtzzWa9+r9RPOeIy5z75aFJNqbt1HfRgKPuYMI
	hfKn55uNn62Fdwh7uoaTCXrIwr4beg7egKRQqr4k/KkFoCAWxBrqv3B/pJH4DnOPi3qOkKcN/xU
	X8BFW3u/xdWjrPwYIRMlq5mpMp0g0YzB+yomrA6qrSZC41107lStfT8fdjaa5P6+aXDpQgIphOl
	jBLwRuMlHA=
X-Received: by 2002:a05:6a00:982:b0:848:6720:6fee with SMTP id d2e1a72fcca58-84e59544f08mr53110b3a.40.1784931221615;
        Fri, 24 Jul 2026 15:13:41 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:48::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e577sm443138b3a.58.2026.07.24.15.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 15:13:40 -0700 (PDT)
Date: Fri, 24 Jul 2026 15:13:37 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
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
Message-ID: <amPjkerd2duU2DH4@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
 <20260721110903.34840531@kernel.org>
 <amPTWGX/3LHepYR3@devvm29614.prn0.facebook.com>
 <20260724143001.5afa8631@kernel.org>
 <amPbqtxPdhs9QrVP@devvm7509.cco0.facebook.com>
 <20260724150716.07c49ad8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724150716.07c49ad8@kernel.org>

On Fri, Jul 24, 2026 at 03:07:16PM -0700, Jakub Kicinski wrote:
> On Fri, 24 Jul 2026 14:41:47 -0700 Stanislav Fomichev wrote:
> > > > Talked to Stan and he mentioned the original idea was not necessarily
> > > > just for link down, but any test that could be considered disruptive to
> > > > other tests, with the idea to eventually introduce some scheduling
> > > > (postpone disruptive until the end).  
> > > 
> > > Perhaps have such conversations on the list? IDK what Stan has in mind.  
> > 
> > I don't have much to add so I didn't post on the list. In my mind, disruptive
> > started as "anything that can lead to a soft reset". But since the
> > sockets tend to survive these well, I do agree that your definition
> > of "link goes down" is a better fit.
> 
> My recollection was basically that the test is not safe to run over
> SSH (without tmux). Hence the link down concern. If we say soft reset
> that'd cover 95% of the tests so it's not very useful.
> 
> The existing doc and README already document the link down AFAICT.

Indeed, so I'll just test and confirm if devmem's existing
ksft_disruptive tests do or can cause link down, and submit a patch
removing for those that don't.
