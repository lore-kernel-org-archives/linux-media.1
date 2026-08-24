Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57711369D56
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584803; cv=none; b=ZjSgq6SXo2u1dXFIczevI693n1e29p9y4A6fOw+/Nsxp6DarU5tDb1OvRZWcQKM7IzOvtUqxCkA6o5vugEJaNxJdpo5kMXCskQmOhRGMTMS1qMOtbMk/0ZgjvcNxyKMw+lei6Ub4TxscmSqgpyBWKcdSBASIoxa5P63X963QOhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584803; c=relaxed/simple;
	bh=vH74McYOt2oYeSHSMlr+72sup8ibEAJ1oV8sQjMq0lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MghjBY8GuXNyO3ntjYbNxUJvusttr229RQaX08WCjNSiYoKFSQ1fxODcz4PQKq15KzM8gI2cA2M1sUD8Ot6UzKZTkXb1W2CWQDlumJdiOtOguErDSAFZ8wZv0cN/nGlkgzOEDl+n5Yo5YsMiUjtXuKoewB4IqTmaCtklI7DgegI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LeoM0iFD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Csneq7hM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LeoM0iFD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Csneq7hM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wMSWmiH1cJai0IaGDoQ6OFd5v1bPfnDOVCJrWuwjf80=;
	b=LeoM0iFDJo8NWNziD7hM78sIEYia5w7TwqxaNou21AovXxFC1Dr/xS9Qc7uDDESZYbvdMz
	tZenoRNFbGH8OJtIblr2IYonChU2kPiXiEv6kXSNCmLEd1sQVOIBmNpnrQQdHRBH3sWr5w
	f6Dyz2IazZiqEJaslnmTKDOL18nOEmo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-Zu2IQG53No24fevgWwVaJw-1; Mon, 24 Aug 2026 11:19:59 -0400
X-MC-Unique: Zu2IQG53No24fevgWwVaJw-1
X-Mimecast-MFC-AGG-ID: Zu2IQG53No24fevgWwVaJw_1787584799
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0f45415cfso35772706d6.2
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 08:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584799; x=1788189599; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wMSWmiH1cJai0IaGDoQ6OFd5v1bPfnDOVCJrWuwjf80=;
        b=Csneq7hMm/y9H/KG60qylLQCQdUWOj1OsTJ+i1HczTCyUXotRGctADDCFc5LPXxzKZ
         v6VEU6a8hU5ev4uJ/TaQz7OEkrbU08vCHxplvuofErnLsXUWk77kbqS4VD8uxt53MEni
         MRfkWjlVdq/KpZ7z9f+pQxNqg3k+UdQPO1CbQ7PQS2zQOUnYuJO06MhTJVBAZpK7kVvW
         va5VsPQRn7d5HkO+jP0/G7f0iV0FkPMchWA2OEMHFqTNo73svsigu5EV/dWwd5DEcGrT
         Xh7LqrR1K5/zN3kcy/KGHqDhzz7ykSZC/OjOKeIZT7dnZR9gdc1d4b7cMkoUilye24u+
         icSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584799; x=1788189599;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMSWmiH1cJai0IaGDoQ6OFd5v1bPfnDOVCJrWuwjf80=;
        b=l/noFP46hS8H4sjsJXPxBnKQtDMMJmXECD/wPQXLU/KuI0wPTCEatUly+6FId74k1a
         hBKozZMMdbnpJSy6fQ8tytJ4KecBfcXC/NahdOSHvTIKm/bN5tRYp14A1bszaf2Ee7bv
         3wD2uJwFWWK/hrdN1XXxGIQpAIQxQQdUlG8UwnIep6C6NfY/e0xk/1t0IdmAkWrH0/T4
         P2s8tMwDF5tP1pvIkJr9MEdqcpn5UsSQHpQ1RGvpECXen1x5j4t6hzzZ7wofJwU2HSgi
         E3ZNpzXrl+RODXzIEWMKD7TO6JAe+D5CgnTYA34Z67VHJ5tPjgPcCGyGw7bOUHo5rsTb
         SusA==
X-Forwarded-Encrypted: i=1; AHgh+RoUkyWIGGpghpbxh/hdGoMj+QeYhVaoUpKKHD/ofcEhqWiKq0rqKMGkFH9xycQ3AWks/e7bRfYoAx2Quw==@vger.kernel.org
X-Gm-Message-State: AFuF++m1zq1aKBQtyLGO3lwDHsVeR5aBGA5pZr/tQu69ibt4tDgrjJPj
	csTw1JgDN/NNXyfYUiXCl6U+wCs3pJCUHLbmAAw5CqhgdyMy4YVEyd1WCCFpyF3myy5nm56spqp
	E2uj8ZgZuBGHCgbwfQCXpYnke9ama/29SI2Wa7eFuIUU01etmS0ZKfG38nwKj7hSU
X-Gm-Gg: AR+sD13aCCMXVw2Hnrn6VCvDpc3ds79mji8a0/rLlQOoozH4FfaIpc2XCWhBO3BtYLr
	qsbMEdHMcY27SXMFxR2i5DAw6aV4UfbD1EfOx4XQy1UkSQOZMqGKZalbD0uiSVbSjjEJJsMZFuc
	jk/upeqLB0y94s2OfPvVn5w2XL1f8LOPLM67o9wkWEChvESc/JX5IQ5Ai5LzPW0ZQ95UVRmCRUE
	hc75Osb3tsTeUeG0uu1Ao/voIVnYO1x+QMCl2mw6v1R0hAmZyozw6KoMkaS6rjSCYwMmGyWrrmy
	si0bcBlnRzYFfFdmcRlnqvVbMCVQLoLlYzDO60PFl+cY3LDJtrqW5qeW/JOKwcoBjTnSyTQqJPk
	TW7STU94vlwV0sHM/wgL3oH8JY/cgJbo4ubE=
X-Received: by 2002:ad4:5d4c:0:b0:908:98fa:f374 with SMTP id 6a1803df08f44-90c8094440bmr304531406d6.6.1787584799041;
        Mon, 24 Aug 2026 08:19:59 -0700 (PDT)
X-Received: by 2002:ad4:5d4c:0:b0:908:98fa:f374 with SMTP id 6a1803df08f44-90c8094440bmr304530556d6.6.1787584798413;
        Mon, 24 Aug 2026 08:19:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93931452sm64597986d6.26.2026.08.24.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:19:57 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:19:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Eugen Hristev <ehristev@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Make sure clk_init_data is fully initialized
Message-ID: <aoxhHNZjrh2kUXXQ@redhat.com>
References: <cover.1787240035.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787240035.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:04:27PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the media subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>

