Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA56A4FECDD
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648196; cv=none; b=JGHB6/iTD2jfd1eyq3H7Lm6i1Ci8cN1ruKljkyH9Xm1IPm4GmJWydmB1h22CjgTpbcRXdBaoqXlXzczjQjF27v0d6zbdnmPwCmFgiMiOQgjTjWPxuScbPy0lc7sC+JAeavvePB49IuwdIVeLwGm7caVUNp8sHXyjiHw3pWYK9No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648196; c=relaxed/simple;
	bh=NiBLOa+Ivz/MGMdtQtUORvBhVtPqCwg0j5rxwwVjFZI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EaISLWjlr3NJEQJoAETilvx57opHYD91kF1lRye0lFCk0oe4I96AvrwlPqM4M76SyUxCmcLweLBCTIbVjQlTJUetB5YMdXEpObi3YW7PCCqdq8DQcHreM9BjAulwH/3b8PKMfB6t6P3JFYXHdWJLDDMSt7zeatfSTr2mDSfwwgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gU+5HCb6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gU+5HCb6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so4647915e9.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789648180; x=1790252980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dtz+Uqi8FvhezfQGwgUreP+CufNocr9p+NqbDN0Xcok=;
        b=gU+5HCb6NEhmBQLVaLIqnXzYCbuW3y+9zP3j/sbrylZD7lHYyFw9pFNkQiORNKn2+9
         ecpocjM18AVXqhmb2SxpKUeXm8j+Y5YY0eqe95Ju9PSzoqQDNVvagBBBRiHmAyaNxoSO
         yrF2knA4eFqyBkfUVMqfIAaC170alJV/Ke3NfGe5vcT8LsMUz1AkGiyw4nqOt58DrBeH
         edFMUx8EXzNK34fToowfRsGPhAcUCtwcD78tvPUV2sxZL80o7IO0qH+1j5wD8x1fouxk
         3I6nNpgWk3sZfc3RW+iF7VrURE/zt9+KM6ybjY5XT/davL5nsM4B5Uuztt8JxBvsRJbA
         86GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648180; x=1790252980;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dtz+Uqi8FvhezfQGwgUreP+CufNocr9p+NqbDN0Xcok=;
        b=yo23bnoRcdVbBkrwi64ViXCcQ7duH0zirD29VSTIk+27IR1LO2P1MD8fI399qFOBum
         8jhvyIijWdaF2fFHHQ1pVFE+GXwe0VitnrM1P3r5z0EGuYNUA9peaXa3OJ4maz2ZhEV+
         yZNG3Q4ztMvQ0v/H1K9fjbTlW7xvsUwikAGdgNBj58Eu+2UC0fiENJomIeusJSkFnSQC
         vZg9c6oJihM4JXEUBqMfokNe15GYgpysXTJbZ7X7bPDqfVlBJB3qryjRF4lWy4wscrHi
         zzL8LtNsXcVvBC6VeKq3PnVltYZBmu0/Hen5Xu4gNuLz1tg1paTfJ6GfTcqd3GfvWdXE
         7TQg==
X-Forwarded-Encrypted: i=1; AKwUvBwjI94K5CFwtzw1riY6jrzjF6XVsRWmU8p6jugoD0atx9HP8lipq9CVwhqhwHuiMXQ8NPBfmPZv6uQV4g==@vger.kernel.org
X-Gm-Message-State: AFuF++m2S8UeiNnAtsPXiBtw+HPF7l2tkr/BH8pLW9mSMzsH2YEzmz9k
	m+84+/dB9qKnSPHMmOfHRYLKUcoFB3dq4TEWd8wsmMjIL5TPLJ9mmQ/E
X-Gm-Gg: AYBFou3iypPWO/uOJaMNsnUzJn8+scNX+BvVz9dsgkPbsNnDDsL3rf/jAeSAb2FdLi8
	P0ys2HY4s4iby6jbOOKwfAW202OFIGdN94fN+eTc16JWmOKHhQTwi6N0+YQlAkdrI9boFWdS4Sn
	lj1ouh4pVHHmbLQEjs2OkogtXl1NepRCenI+FK2MyI+3CAZQT079sHFdoXV76JJgzMLM15qBnfA
	1w1sokMe9uEZ2dyxHi9FBQaPmvm9iBvNPu2kIznBGQ5SyoSwxbzn1S4V7ILoFHIAC2amk222aRk
	m68lpa3p5dwdMHaXbV+FYrm9SvAwPXjPaYL91ulwmUtiyfEJroeLXCQYJZkL1idQ7wbmNwbXA92
	bL7pIK8TAyOU8qABX8aZaP1T7jXk5ZFEBER3a0b8IStn/ruCxnd/yFFLu9LbJh7vkfr9MNvRtU5
	MxYrRlXqoM21h52jvwZr8x+WBKMOQWen+C9tUM7lpUl5APic3loy6yPZX2zx/AMaJZBc+ycgbh4
	IWK9lGYiQqQPiFq3+nh+SCTTcb7mGPTwvZY
X-Received: by 2002:a7b:c35a:0:b0:49f:bcb7:8e9 with SMTP id 5b1f17b1804b1-49fbcb70a1bmr64001725e9.9.1789648179633;
        Thu, 17 Sep 2026 05:29:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1ce79csm82621135e9.0.2026.09.17.05.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:29:39 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:29:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, wine-devel@list.winehq.org,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] file: make struct fd_prepare const and kill its err
 field
Message-ID: <20260917132937.5a15904e@pumpkin>
In-Reply-To: <20260917-work-file-fd_prepare-v1-4-b87534ca49f3@kernel.org>
References: <20260917-work-file-fd_prepare-v1-0-b87534ca49f3@kernel.org>
	<20260917-work-file-fd_prepare-v1-4-b87534ca49f3@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 11:09:45 +0200
Christian Brauner <brauner@kernel.org> wrote:

> FD_PREPARE() releases the fd as soon as the file expression fails. The
> fd either holds the descriptor or the error. The separate field is
> redundant. Make fd and file plain members and struct fd_prepare simpler.
> 
> Callers of FD_PREPARE() get a const pointer to the guard. Simplify all
> users as they can now easily access the trivial struct.
> 
...
> @@ -191,35 +175,39 @@ static __always_inline struct fd_prepare __fd_prepare(int fd, struct file *file)
>   * was allocated. If fd_publish() was called the fd and file are
>   * published and cleanup becomes a nop.
>   *
> - * @_fdf: name of struct fd_prepare variable to define
> + * @_fdf: name of the const struct fd_prepare pointer to define
>   * @_fd_flags: flags for get_unused_fd_flags()
>   * @_file_owned: struct file to take ownership of (can be expression)
>   */
> -#define FD_PREPARE(_fdf, _fd_flags, _file_owned)			\
> -	struct fd_prepare _fdf __cleanup(__fd_prepare_cleanup) = ({	\
> +#define __FD_PREPARE(_guard, _fdf, _fd_flags, _file_owned)		\
> +	struct fd_prepare _guard __cleanup(__fd_prepare_cleanup) = ({	\
>  		int __fd = get_unused_fd_flags(_fd_flags);		\
>  		__fd_prepare(__fd, __fd < 0 ? NULL : (_file_owned));	\
> -	})
> +	});								\
> +	const struct fd_prepare *const _fdf = &_guard

Since the struct is only written by its initialiser, can't it just
be 'const' ?

David
