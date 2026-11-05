Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888796;
	b=J2B4oIBs3gmqKtNWILdcgyeq/5KZGODLQYQnMlUfneF1N700AwP2k0t0z0A3IhRe3AEB
	 nw+w2sHB2IGEJkceTiPgc2oIY1//9GPrcIpkKwb8rVgfMl6GvQ6EaayDbz0XytllUjBwm
	 YuQ6CJypuI0wFFfyv8DhjXYSIqiMpyK3Dl2hP/XRcFeQpx2wgqioZGeTGPWGoCTAuroLY
	 CchR1pIgHanVwm8i3TUkQmsg3EI50HvvxD2oZ3xI1w5gFd0WHGD9Srj0MB1HiKoWvHAlp
	 AFE7WcqsiyY+vq5mNyuc7DyBo1wP4kmMSs46oTehnMWkvwg1DWnDEhMhrY6dY3iqAMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xUchQ5Xm1iZNw7GbdiPnDVwqy30Ug/2vGTaSDMO7KX8=;
	b=4W7O4LfBkf0/oYmbsDMiR+lVbnM5pjYZX6Ft7kn2sE/8hhX/I2m5DVqOYvP6imkB6THu
	 frhCi4PyI42XjcFAYQa9gfSGY4FylLa27W2AuCABh4s/g0+dPRCg+oxR6V3nhj/+fDW4n
	 A+8MCqjF+VOzTwO9p4KPRUjC+EOwNGWiKOl5etWBoYmKL2tioPWi+chCay+w/ID9xE4ma
	 VMDV72BD9ELqWjJrYfnQ8x/gVag3iqE5YfnMNgDm1DD7AajWdrz0DGLAqnLwreFsc3r3R
	 OEHQNOYKcihqFsyuHovWNBktKPQEQtX5fdfKu+H+kdP9yjaMjGRqE8YFnwMmZ9in88g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8Li5ch9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC68606A328
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 14:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC68606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o8Li5ch9
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-85ac281604dso1052608a34.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 06:26:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793888795; cv=none;
        d=google.com; s=arc-20260327;
        b=pHhl2MWo1vZrlyAEN+Gz4RkB4AIhNdI1mnmprXcbiWAQ6yFbTH2tD6tmCDTE20q4U2
         cSNkSh9RCb6ZIRieBeuYpcOfqr4DlvgfQT2/R81FOQe3qqdQ8WzEcSNfi2rJni1wyxN9
         oRIQSOLrbMvYwmeMwscSiYgD3rlwG/1IAKZIrlyidNenwCSpZyLTkwcSphgkDxquyQ7N
         wEY/EQw0cSub8zc/z9FrY+Lb2aiucobWhXCmDWXcUUGzxGtXv0ZF2M0CmMNumwWb/0Xv
         F3Yj0kpjAfaiL2Aw0l17GQyJh6+vJM45bHJAaBMDSzxhKc3pNzpQY2YE7rq9E7nDD8PO
         5SaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xUchQ5Xm1iZNw7GbdiPnDVwqy30Ug/2vGTaSDMO7KX8=;
        fh=TPVoSKKzTJXd7Lixx4WDVRuomKXvFcBVFCESu87+xmY=;
        b=qA0hUhkX3SjBlc+poIzRgFV9WhjQ2AqFw3hzSeKZ3IsWaV77f7BDlnYWRNxoKFiZBe
         GcE1Tp51bm812QMSUKgU1qde6WRG5RC4l3Jz9vEwsrdg5q+Fp2MsVRA3JHd77cGCf22s
         cH2tF7dhxLp+33zLyotjzTpb9+OgoqWtHnLboe+zZpTjcj7BIOVS2oWGC6qxMvOGS7nc
         wZgReLzaeRntmZDL8ozNV5inJV8yH5waCGiyj4B4KtaexxO4zHI4bEiLWR455cO5JRN0
         C/CqsNHZSlySKk7BeLa7eDaZzHDeJAXPEG8seCAlXzDdtw1OCJ/zGOdBTJuvpYDZ4Klw
         YKfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888795; x=1794493595; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUchQ5Xm1iZNw7GbdiPnDVwqy30Ug/2vGTaSDMO7KX8=;
        b=o8Li5ch9s4j37gJ7PvWnkkvwFSXGMimqlN0eeqZWpH1SsXXZpV3Jq6srS6qwpABKXs
         EyEADwEoKm9TWTOkl3DNgdzmNePiz+BuElTvuJDmg5FWVrfdW8oWSlP/T0f7NlMrPtK6
         8rJesGLdXtLd57az2vdBRTPo0MdZPKUnho7WasGWfhQa5Br/WR8s+VeyR2Jlumb5pA1v
         TE3pYikITdnU2qhAwpAqSwQQFO6sU6y67/E6vhrcP/A0tq7cahfoOjYlGjHxQwoBTsOu
         +q47fq6YVQ03iMPor7p7oTZxV0/q0a+9Wy2fHJ/9K1pxE+pTsTx2WdU2ocav2Ykug9iY
         mlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888795; x=1794493595;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUchQ5Xm1iZNw7GbdiPnDVwqy30Ug/2vGTaSDMO7KX8=;
        b=sZN5uQ3EkHGDI4DZYf7Fw5fS4VeHVB+j/QM0O7tIlwE5DI10tICZU15UgWN2ggZkFD
         PjIOFe8d+l+fh4Qeonh7StnQZG6FvQx+ru6PLa6hQduaw9Rf9tjb5zqWDTEJATwVqtp3
         vCVUZDtT+JI250uSMhRzxThhBvk/rO95aq4LfOL7U8ukXUws9l8CilelzCvEgNf9ykX6
         SB1Gzv9n/mCU093322ueLphHAne8nbih3YQ4bRP/VAQXs6xfwKZQuIotQf6PTPtykIHc
         Rh1yEZLln1NThCUJvinxJOEC9yaiU5yn94Zawgpx+CW63giFpEmgheQK/uiRbaLrvG4Q
         LfVw==
X-Forwarded-Encrypted: i=1; AKwUvBxg1UNQl1P6oZBU9BJLngvrbW+lwLBfJv3bhF2hp41WQCUL5OV/0SQaV0cMxa0Xn4nMhYITStXzEbZZUw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8cMEG3ueTxcIrGlHCdQCElmVCfpYMDiah/DuVU2oI5bd3tp6Ox
	7Z/B6zHALezoBt/GwGxhwgyCcadfEk111CxW5U8AgiwPgB2uVZmP+h3CNjCd3e6mA+h968DzJOc
	Aiz+UZN3sZmae92JdvTLPz2MkxcoBIVI=
X-Gm-Gg: AYBFou3d2vDdyKWDwSe7Q6zUxjL5C8fYibHEpBl3wb5G1v/XrGODLOXkL5iVDRHK52u
	u8bwMMKGNDbhqVnuAlHCJXdh2Yw1ilfwuGdgulApCluRFdK4OLpIXjcS692+usfOS15zmCzMbne
	VufSANOkhtton0VbXb+vZ6V1kYp1QE5lQxJXPYSfbcmwrFSXU+vHD4WoUgLUPXCCZFxeuqJsN6s
	FH/7YWec7CHJKuUC2jmBIC1zPnduhxWHQWSMzE8XXVHKEVD2YMdhOHlWQ1xBGLIW78lUPzdJaWQ
	42MJSxVUXxavyElMusJ8eEQyrQJDv5ZbfquNVLk3V1xmrMIFQdlLQsixwD0xxyWzb4rEywtVlH4
	yX4vths5j8b2BS6T4CO3TbjD+ZeocTbFHNmWnHKYxYmx6A/lQgmWXyAWeJGx/JsEy8NIdtKQ=
X-Received: by 2002:a05:6808:6505:b0:4f3:68d6:f0dd with SMTP id
 5614622812f47-5640de6b8e7mr14101342b6e.38.1793888794825; Thu, 05 Nov 2026
 06:26:34 -0800 (PST)
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 06:26:34 -0800
Received: from 41474967715 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Nov 2026 06:26:34 -0800
From: Kirtikumar Anandrao Ramchandani <kirtiar15502@gmail.com>
In-Reply-To: <e70e62f1-08bc-42cd-9cf8-62ce54cc8be6@amd.com>
References: <CADZg-m3A_i_X0L-UBi=eMEx7RzhR_sqU5NVLrQ75JJdR=2ASKQ@mail.gmail.com>
 <e70e62f1-08bc-42cd-9cf8-62ce54cc8be6@amd.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 5 Nov 2026 06:26:34 -0800
X-Gm-Features: AclHuK9A_X6NUn00AQrkewf_ZnXh0w0bvv5O92l_7rClcd8nF6ebhUWqPH1wjAo
Message-ID: <CADZg-m1y481=uwjDX2Ue7SSmtJDt=vOP8goaJ8C0ccbqBctzfg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf/sw_sync: Avoid taking references to released fences
To: =?UTF-8?B?Q2hyaXN0aWFuIEvDg8aSw4LCtm5pZw==?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Philipp Stanner <phasta@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, syzkaller-bugs@googlegroups.com, 
	syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

I have sent v4 with a code comment explaining that the timeline lock
serializes with timeline_fence_release(), keeping the sync point allocated
while dma_fence_get_rcu() examines its reference count. The zero-reference
case now leaves list and rb-tree removal to timeline_fence_release(), and
the Fixes tag has been dropped.

Regards,
Kirtikumar
