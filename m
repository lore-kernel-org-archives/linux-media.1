Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C39B1F0E29
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 00:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785198346; cv=none; b=LrVs4rQVJf9/rPIY1ACiYCq0Kr2kk2HDElxBf2V5vkSezRWJiG1PLOV3Ed0XAl2HeWHvpMcggCY3qX7rL54vU3Z0GpEOjIe4IAmQWdMSX74SbFzdDpz/ODD5acOPia4Vh0ejItEGsDrVzWIzpnHiEY5m0E0UTIAckcNQhvXyhJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785198346; c=relaxed/simple;
	bh=JXtzyZbPdKYunneaFIecOBMZxaTfcF91zRrVJogtLIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jH7Mnf48XYmZ7egHqP/Ee6LLTxc9kIhNv/w8allI/DQdKyqrEJ6paUl7FE5ACTYirpX8CtuiLbCVov3Q2SzbeedgrjSS69beCH4w95TSs3Ho5IcV+gFwzsY55H4enOcH8uKiQtoe9t8QmQKuQwZvqs3b/WdcvEWHUD6IPL4mkqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2fVJbBb; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2fVJbBb"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so282338a91.2
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 17:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785198345; x=1785803145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=as53GHjZpbLbIzF+K9Jx+5/hmvo3LdjCnw1qaLvpW0Q=;
        b=r2fVJbBb2MwFXhqPmk0JzMUiGI7+XxrZpr2zNBzOXDdwjZLZ1PmWtRyQZhRl8IgaBr
         Sd0AMf7gzFlRwKkdQ51v74iq0Dc90uR6Alq1vQrHzodvZeis636SE0AtwYXMAl9Hc176
         ZmYi+/S6XNQRSR9P7vLI60PzOOy5tggtKeYfJdwLLBMS1EN//NIPJ+YoLeMGyeL7faZc
         2elFfXXKSBOmyFynY77NjW314CbeNgA+C9bpfhOriSr4pTTk0kQJ/4oOTaQSpa90zFZa
         eUL+/MDWwAD5L6OfmRFUAsqsXJkcXexe5l88l4/rY4QvIK52IpF2CPuwe1XlZ0Tll05D
         g0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785198345; x=1785803145;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=as53GHjZpbLbIzF+K9Jx+5/hmvo3LdjCnw1qaLvpW0Q=;
        b=B7T/yb/NTTY2LJu8MY9ktVrW0/wRby8IJguVPHEdUQ33+qjfE4kaCBud0QQGVJIpYz
         y2avm9XVYCNzCFIDaLbXK1J6VJY0B7nfoJPB0+nMivbOmkAA1NV5TqUvtwzxW4ZBB66b
         bSA0YbwefJXR3L5rllitzlf5CHO3dV/7lRarPfrncF/QpoIdj+JVtR8gHEyVhwFxRc/V
         ujF3jZdoNdbOAciM94T7k2Hii+dLQwC+XE9zrRgUNG4nw2Y6ouWfi2Ga+MkALBGLpxQ9
         Z3OKIBQL9rFgJwUpQv3moNZmsKI//wTJQ78y6WmMI4N7BkUdjJd8KKKRaak9AkxWGU7c
         JuBw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2cXq3CK0swc+3K+hxbpIihy6l9xy0a3ExWVwXQAEJx3nKUiui6Z9tAda+rZPwq+RC7hpGbFtrbkM4Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziecWQSdI8IT/xA9Ms7p7fKviecZGX8Zr9hY0kILFOE+nuS7Yf
	okuZnN4Fz04iWVbGSvfP+k4p7ApqLdyDpjvjAo25laCmUCOakoOGZY51
X-Gm-Gg: AR+sD118ZmSrJkVOQFqDJ6Zyc+7Kh+nvXlXW1DJMszRFYsm8uhKlxU6nFDqRkUOaeHb
	A6GLz5B3OwJlO60me+GjhQ7rr0xEdMqZKcEbYufaGfx5IlFcEVitJsQAVxKSwRy7KhEEjdVbd91
	1pCPYY8l3r3wFfwH5nx5CTSzjfALEzYM69gQ+JNOvvUKTtLEE9YdRWBufcaGJvBRBU3p9gIZb9k
	CLrvPmd3QNk5h15kSMYTLKqg5gJ7wxxqvWfV6Ed8JPWSDkHxvkC/l5HyBhACG9LnWw7FOcovlaZ
	tQgEkmNDVdfZ4DSS+qDCZhbB/fI4nmWKsGm9ziaqddW2Rk8ghOjzhWE6mqbqhNxMeu8iF2tUsvA
	E8YHPDPnf3DYKna2UEu52YxCrdrnXshI3KgB+vG4CgL6jQBg+QJw3SLy/Xt5UiKCSfvXdnC7XXD
	20Jj/m5GYU2uwwRzmkD3XYq5d+PX5qSPc6QFnhx3xpCzR9ApzTYyaJDWH8l1NnF/AMoWtC8ciZ2
	/XgrJiSq6Mt6F2AQ3w=
X-Received: by 2002:a17:90b:5864:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38f6a324937mr107418a91.1.1785198343326;
        Mon, 27 Jul 2026 17:25:43 -0700 (PDT)
Received: from FAIZEL-KB ([2001:569:5b64:e100:37da:2f8a:5b33:6b68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f64111441sm482942a91.1.2026.07.27.17.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:25:42 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:25:40 -0700
From: Faizel K B <faizel.kb@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Bin Du <bin.du@amd.com>, Nirujogi Pratap <pratap.nirujogi@amd.com>, 
	Sultan Alsawaf <sultan@kerneltoast.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Abylay Ospan <aospan@amazon.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/9] media: vimc: Ensure that pixel_rate fits in 32 bits
Message-ID: <2vz75korzgv3s32ekl2fsgs45erst3s4wd3yxsh6uxyxxn7ddy@2ynykg6ary52>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
 <20260629-cocci-7-2-v1-4-5884c80ee3b6@chromium.org>
 <qrcq3ntszxswpk2wbeb7uq4gq3mncegwtoncyplkhdhrslzghs@dhkvpb6n5jsf>
 <CANiDSCs9s03DUjKwcPgDtZt2QJ4i0FGwab4zpEP+wCawagSC2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CANiDSCs9s03DUjKwcPgDtZt2QJ4i0FGwab4zpEP+wCawagSC2Q@mail.gmail.com>

On Mon, Jul 27, 2026 at 12:15:35AM +0200, Ricardo Ribalda wrote:
>Hi Faizel
>
>I was not on cc on
>https://lore.kernel.org/lkml/CAMuHMdVx80Eh8w5-OioH-Uyahea0ZRQHUVg9MBfQ4uEjaxM5Lg@mail.gmail.com/
>so I was unaware of that proposal
>
>I agree, something like this looks cleaner and removes the sanity check.
>
>My patch has already landed in media-committers/next so you need to
>send a patch on top of it.
>

Thank you. Its done
Link: https://lore.kernel.org/lkml/20260728001545.331638-1-faizel.kb@gmail.com/ 

Regards
Faizel
