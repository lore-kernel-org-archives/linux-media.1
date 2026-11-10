Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318015;
	b=YVw65SEbScjZoIAk2Qq2uANq2fy7Ri6zo4VRME7d5j61XEyxlRhUCesNfJuIkQ0OYsQC
	 IL6Y3klFRZEnAv8dolmxKZLbobv60sjPwlkt263s1r3+gwVRyrVdnTo4uqsmIgPcY+SJs
	 mdfsZniGd9uXRXBpBWJ+86M9mRQPNixM81R90mskhwXxUGlJCu9XWCBgou5Q+sK98QBjq
	 nAHSPSfpL402gV8HxtUzkJajWR1PHhoUVORvWYALkFj2+X3GsX3aV0hqFWUPsJ5zbcfPm
	 U6TkohRPbI6/gz8jcdszniiyWzCUHrQ8iYkbWtDz5Mw4OmP+Beu2hi2Y40+oMpQEd8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318015;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=3c2WpukRa6d5qbdvXnuRxcTvhXaqbpkaY6h5ED2Zn2k=;
	b=X8PMkknMZo15t1UAy6NICEzlaIDcsqkVuKtGEUr8t60cr5M2y4BZkgsEYtINPzYRs98x
	 ZyKC/psQd+MneqxBqgoqjXoQHTmKPrKbmxMR59lnP/fC0T9KgLe4Vi/g/n9g+vWlGApv0
	 pck7jtj0PPxhYATRc0q2gQACnboq2O8k/nrsE6XHicelxXFxuiu1zPXWfCTVv6wySegPj
	 KwHNk1O7zDWXwkAKjQmcJp0Y34mr7sBzpqwrLzuX5hTLOiaHVonLSnUCwmuUIt7VZRXMb
	 uGW2Amtg6NmRc7bR130Krog06Q9pXLMlaRv5qHAmxt9Eq9MVTCwUzJMjsGJQUH+iNmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F7E60A2621
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 13:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F7E60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1343945f8f.2
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 05:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318014; x=1794922814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3c2WpukRa6d5qbdvXnuRxcTvhXaqbpkaY6h5ED2Zn2k=;
        b=JR/f5O7Yr33xfgIqa+Yn0IfVQxuxrZhR3AjecczZ+JVUrTmkYe9GZmNr6YFIXP+o3u
         0073DJSnFWZ8XgMMHMHKT6SLpOhoYReKJBYmYvOxtfLxT8jQpF8Hx+i2TluYewAheanX
         uvV5ZVB64JO9xNKDf2RBtzwhW2yMOk01IUO/3D8T9cSescKDUdpU/qeIRkadMYqBYjRy
         gGgyAcLx+FRj+fjxniYk3GFkGw5kbq1li6Qq8WvYmhvlD04CvV3/LSumwXKg9gk3h8xO
         pJc9tKMS+9OGORr2VYw/EyWOnYaVRR/2g9oMFoUYM4bMYNzzWFhTdRuK6EboPdDFg/oP
         0Qlw==
X-Forwarded-Encrypted: i=1; AL+hErFiwW4XKi7O5fXIh2VAdwaRq8h+fofa0Dbfxdql+PdMzFXVRASvDoWfOGaf4oBNKP5gTFgM+ZJgf23B7w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ezN+cxLoCOTe4wwuNPgnMLC+9Gdra2V+zkpjdp6PDf9vE6TuT
	9qVp/WYGDmsNQeeMkIsjjS1UH86TVh1Dt+Bj46GPQtSVSs7pMd2I4fhz
X-Gm-Gg: AYBFou1nRYUoujzK1t3vprHnIStxmHeSyd3rsSlqiP6mhkA8efXVzniw27o3DsYCSij
	VPP3fnaADWR52bKQy8xVf+u3xnwbMoSaN+fHOftN0MEpNcwr8A+LtzqlMPricRAosZXIj4s6imP
	Ui+s5gT/lvvJqzRGWwCpci5z+jwEGkSBL8mnuGp19BB3+pdgqCBUOQ30Xt7SK3MncSY/dH5QA7K
	f4GmbljH0ha/0YwdiCDzHn0X09nZDbN5dnQeihoAddabTE2hbicc5v02dDA1CmAj4rbtyAesocy
	xzQKHzmJOjHZ8/Gm/r5z8WM3Np4MlRfTYRdsmLsljiZKuyURfpywjVxRML1f3phd5aZqTpzfZIt
	8+ROAzpzYExTMSLxHj5IJz5IIXP4TWXxSQbSzYLS8QaTdAKQOCDeG5hunzGtL9X1IERVxt8SS7L
	BsxCvqcYi0xDnGl8+kK76B620OM7bLV7x+0URjfA3VNTGujo8VjArfx7JtTPhZnO/NMn9mJAp0B
	7M4XyLSVntImhhiNsU20xKAFKZ4w56AZfSSIO9zPPtFipCulSZtBbBZb96B1NNtsXelArV2KRfW
	hL7vZB+J/34VlJC8YpGFdjqbuv3s52lsXPkJlyGyhw8N6I99OBzEjBCYEmoY12qbEoHMvZV6tem
	Sef83g9UJ8m8kwUrJOZ/QEUUM+qRY51CdHLM/lcfXt1sh5KCO32XatDXz4p75WnDh
X-Received: by 2002:a5d:584f:0:b0:488:823d:5086 with SMTP id ffacd0b85a97d-49827fd20ffmr5377884f8f.0.1794318013331;
        Tue, 10 Nov 2026 05:40:13 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb158sm5074218f8f.36.2026.11.10.05.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:40:12 -0800 (PST)
Date: Tue, 10 Nov 2026 16:40:09 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Kincses =?iso-8859-1?Q?Benj=E1min?= <kincses.benjamin2007@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix spelling in hmm_bo log
 messages
Message-ID: <avMeucyFU9r_nfP2@stanley.mountain>
References: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB9ndWsADtrZNFLafOoO7qAdgWncBbKbBkLVv4P8b6jyTwx4qw@mail.gmail.com>

On Tue, Nov 10, 2026 at 12:57:49PM +0100, Kincses Benjámin wrote:
> Three hmm_bo log messages misspell the past tense of 'bind'.
> Fix them to use 'bound', as listed in scripts/spelling.txt.
> Only string literals are changed; no functional change.
> 
> Signed-off-by: Benjamin Kincses <kincses.benjamin2007@gmail.com>
> ---

The patch is corrupted.  Read the first couple paragraphs of
Documentation/process/email-clients.rst

regards,
dan carpenter

