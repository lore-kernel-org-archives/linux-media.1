Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361E24E06CB
	for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 12:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647770; cv=none; b=PrsXZxbhjPptaEaJ1qTMvIHpcA0nrhJ3K1OXL5IgrBvuvjpIq4KDBb+mjhUOHq08Y2Sl8RZiy2pP1LiJevqXSngT2mc7HePlw0EDfQOrCuToCvbbSKe7qQr8iV1cBhLoSHl7jDsvdZSDwBS8X908qLCo6poHzwsQuElSXyHdhCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647770; c=relaxed/simple;
	bh=OJmskDiFOgBotmQnXQAOWrnTyjAq3r/ZPkOzXCktDOc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gC2Adv2aiRP+AWD9KeF0vPmAPNzEHI37t8eGCIkncPk45alNS2L5Aji3CI+DWxClXrRu3slazlfC+oB93eDtSaifZLvQ5wJSZhloIi7eTgllJ14UPe6AT+6NwCe7Mb5WY5JGg5c7vrA5bsvFFy3m118ScmtONJUmZ8YuI01zxXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8MWUiGW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8MWUiGW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso7274945e9.3
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2026 05:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789647757; x=1790252557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p0zmU2W+3BnffNO8O4v0JPRgPOvlhktXL05mpLnU1xo=;
        b=W8MWUiGWkLnPE3LZwZMs+M6hjewk3bifMXlRxyzDreqvti1vU2oOe8kuHIJilh+a4j
         avmi0gE2ouNHVuMutBqsR46ibWdW2hMSUIg+O7ewEblQDSqXn5oywiAzmcEOAAbnHJh9
         CowIX7j0Z9oM0FI7AJhmCimPMAgxALlDijVAFCnLuHoqmAoi4nozpd09gBGC/BiDrVMP
         v8CWYPOQj7wYPLWd3xvspz5rrIP7ZmsQlXq/fr57voEYreoEfZ0jpBHODcwFTuLtahTp
         5Ork4vvRYVxbjDbbXem88rlm5er/r+K8QtAMln4o0OqF8zBcjtvMGd0fo9MP/8kOij+L
         7TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647757; x=1790252557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0zmU2W+3BnffNO8O4v0JPRgPOvlhktXL05mpLnU1xo=;
        b=e3JAOiHq+9k3BGMTdaORyVBrXBi/7pq+0Z2BoZYjDn0o2lsXEGyrtYD6NJ3Ge9xYai
         S7ddpNdqpsamzt4R8ble6IATG397zwVLXq7X1nDTOKpcNy17Y2n0wjAB6V2JDO+Izuo0
         vikEVKPqJnNkcKkZUhy/6CaLwFZtwo9EMpmh3b9dy+WKDZ+le7RTN16fGD2JzvA4Npy5
         EEnmFVZy68IONaWsbysCdbW0y5TmMZvm8AWDQc9C8KFGhtXF4kK7uniL+2tzdebMJTkf
         EzsYDY32F191t+FmQhVrHZCE4W6K9TwfDiYqehEjI0c5IOAUVayAbiQsJuNezDM5zIKh
         2F8g==
X-Forwarded-Encrypted: i=1; AKwUvBxruIUzOQ3OqD+USockbCcjLoXqp+kNLPrGYgIfy0eB20Cfuft4i4snvf8gKNDfBTXBS2M4AgIIF/XPnA==@vger.kernel.org
X-Gm-Message-State: AFuF++mJpmCI4ZpjZEjAgCpPoNFAxMUnIlF5VFCRFGy78PxQ0m9pmjvE
	PS0fMb/g9tChG22TMQlO3l1JyQHRtjz8iSJA7hpiB6+ISmR0ZyjZdbfM
X-Gm-Gg: AYBFou3L38hN1qX4m5qC95Mp8LiOI5mHJtZ8p1y8sVSeY4vsOOvxFythrGvcSKdvyhm
	M/78jalHSGyCSASc6Zif2qlPGJ0RD7600q+5QuyQg6n5ho63NASydFE3bE6oedGk6nqNBaX/gzd
	94CbsZPcKoHGKawXAIUb1eJVJXCePkUJInGg8upGvq5xVqJsE6pyluJrRUTUwIm+4xtpuZngF9s
	LtNbsaPjV8lAFOXG4lKIAI3MFwyPz2RB3AxFP0ayjuC8/Zqv+MuJDY9lsdzoYK9HwMbs7Aau3XC
	BF3b1yBD5mr8H47Hhpgjhf5G9RMtKhagwE7dREAJbW/UXfyVxusgpPFBV5g2EQzsjDjujFzP0Th
	98iQR6V8dinZQK0N/XI3k/r7F4Y3IlqFFJPI61WayzPJz2lOVaQF0fAkW6v8sDe9HmNrYB7/E3x
	1k5RgQFK57qq0+zIyPIyZ8NdmRq95MD76901R1Y6bjLJIeFTaz3OioVBy9ZzT24EJY6dTgp+i5U
	QpjxYHge92YUrD4GwGH2PNDUuMH34ymqiB8
X-Received: by 2002:a05:600c:4ed4:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49eac462571mr73688225e9.2.1789647756735;
        Thu, 17 Sep 2026 05:22:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm15969081f8f.2.2026.09.17.05.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:22:36 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:22:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, wine-devel@list.winehq.org,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] file: declare the FD_PREPARE() variable with
 __cleanup() directly
Message-ID: <20260917132231.26314015@pumpkin>
In-Reply-To: <20260917-work-file-fd_prepare-v1-2-b87534ca49f3@kernel.org>
References: <20260917-work-file-fd_prepare-v1-0-b87534ca49f3@kernel.org>
	<20260917-work-file-fd_prepare-v1-2-b87534ca49f3@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 11:09:43 +0200
Christian Brauner <brauner@kernel.org> wrote:

> The whole CLASS_INIT() detour isn't needed. Use __cleanup() directly and
> give the destructor a private name.

It also makes the code enormously easier to read.

David

> 
> No functional changes.
> 
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  include/linux/file.h | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/file.h b/include/linux/file.h
> index 2b864f457211..926cc58d0b7f 100644
> --- a/include/linux/file.h
> +++ b/include/linux/file.h
> @@ -146,9 +146,6 @@ struct fd_prepare {
>  	struct file *__file; /* do not access directly */
>  };
>  
> -/* Typedef for fd_prepare cleanup guards. */
> -typedef struct fd_prepare class_fd_prepare_t;
> -
>  /*
>   * Accessors for fd_prepare class members.
>   * _Generic() is used for zero-cost type safety.
> @@ -160,7 +157,7 @@ typedef struct fd_prepare class_fd_prepare_t;
>  	(_Generic((_fdf), struct fd_prepare: (_fdf).__file))
>  
>  /* Do not use directly. */
> -static __always_inline void class_fd_prepare_destructor(const struct fd_prepare *fdf)
> +static __always_inline void __fd_prepare_cleanup(const struct fd_prepare *fdf)
>  {
>  	if (unlikely(fdf->__fd >= 0)) {
>  		put_unused_fd(fdf->__fd);
> @@ -199,10 +196,10 @@ static __always_inline struct fd_prepare __fd_prepare(int fd, struct file *file)
>   * @_file_owned: struct file to take ownership of (can be expression)
>   */
>  #define FD_PREPARE(_fdf, _fd_flags, _file_owned)			\
> -	CLASS_INIT(fd_prepare, _fdf, ({					\
> +	struct fd_prepare _fdf __cleanup(__fd_prepare_cleanup) = ({	\
>  		int __fd = get_unused_fd_flags(_fd_flags);		\
>  		__fd_prepare(__fd, __fd < 0 ? NULL : (_file_owned));	\
> -	}))
> +	})
>  
>  /* Do not use directly. */
>  static __always_inline int __fd_publish(struct fd_prepare *fdf)
> 

