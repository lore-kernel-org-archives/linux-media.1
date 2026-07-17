Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A223C3453
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 07:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272050; cv=none; b=l+SM3W7ACR+1XWTxyOTvCvjObKEYpkpdRrx6CuISFt9QTShyxSkrN66BM1ewgxut+kSogI8VfkF2cXYnzgVQvsAz5yPpFEyLr6k9JCsgY05/oW976uaIEQ2hjBucTEqo7tsFjVUc8nNH3T6pHlRQw2FhuiooPmil/xuAYzJCFKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272050; c=relaxed/simple;
	bh=TWJULxJCKYD8lAG9/bBgGAdQ290Riy+Guowxce5yRtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oAEoQBQj4nvugaI7/HMmxqSwhrv+CEF5FccK5ev0XSq4EJLdo7n2fxH1nRLvGurTIuyIokMWCbv2PuNdCmTfk73uuyzprByqkpRj7WlbpkouUIhMkjS85ZG04DyNpYgi1vrbcxSHHCRpEr1IkV9EdVFkKm2ML9F5pruJ5Jl8FqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L8KGPrUW; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L8KGPrUW"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15b33f7b23so1098343966b.3
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 00:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784272047; x=1784876847; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkmhPcMQizpSJ0cxQqSXnDgGsG0fYJSSu1lv1n0/Fu0=;
        b=L8KGPrUWcbxYx0OHKMP/Guph4WWcxmOe5Vd2cfWelOLqxQVpoU5wzs9hUjKeswSkOJ
         qsb53uKf1zmiWwCatfTyTPlyqxEixeERI1umTGyUospMzuWIfuRjP/uLizwKT/fE6QT1
         F1fyy5Bde66JhzurnZv9DmYeAHrwHV7U5EbiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784272047; x=1784876847;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vkmhPcMQizpSJ0cxQqSXnDgGsG0fYJSSu1lv1n0/Fu0=;
        b=fsMp6i/cMP/tJ5LabFzCoTfa8mwSLB1Mnyh16OBqJkHDAkQlZov9g402r/hKATWPgg
         SYNommhkJH3vbgIHPAKyXiI2utD5ZNMytAQ3I0HYi86AlTcaqlfjQQJLdTIQxw632H9H
         hGDWequhyYz+hJljGRf+y9JG7gzDfUnbWKRpqyHaXZBK2RdOb5jbCf2Z1AYKbKir7Aiu
         5tXYu4+O/Id5PR58Whn+kXLgKcXgPD6wv+jlIxgKJg6CoCVNYVO6+sJRSqU2RW5+diDa
         tWRs3lFJ+mUpXI+MpmiOeGeqLM32kS8m0OeOJ+dI4o2vX7F63cUHNG19mspJnWfmhr1V
         IDgg==
X-Forwarded-Encrypted: i=1; AHgh+RqtrJzY+OGT4G57574AlkfhDPznXNHur1VfaSW+ow/pdI4P8QQjzBixz8Wm5m6zDORC0mxI8AVOOKjQlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcGu7kHnkAQfEYgl39FqVS9hoxpsJeVF5F3EX0cMj5H9vTnILi
	EK1eGbJJelVfpmsp53zdFy4ZB3yjCnLU7vJJDsOMGx/SWC7rOrq+aoRBfux1aSUvLhrDhc0c7+x
	4m32xyQ==
X-Gm-Gg: AfdE7cneg18bCUF81XX6XDUadf5lGeqkGabeHlu7Q973AW5pTG13/tLI2T6Fac+i/yl
	P5wRL3t0Jtwx/8aCTdqyqihXajdMBt/fYzGgDBEC/Gqpl3XCVqtlBJ40QTADVl2YjQdeZmaikU/
	piXENbjjXxQz1wFDHP0HXBMelvIvBX3Jmtm0Wln1yIsE5wmnQuZF/q9jltNQFZIbBBqoD6LrHt8
	/4YDl6nsEB1zyJTqijFHUA8ZhGQh8qj8sjk89lO7KBJ9XQqqdb3PqFnpPNp2BzaxfADjMh+m0io
	zdY68SzpmjIuMigGCyv/1q3tBYUVAakxjbc9y8N+l6QSaskjpbe+8Q0eXlqZ0jHh6ItX5tmBS8D
	mL0iTWbBDZRnz9TXjl97p2b40knOmQjhFzd3/+3LV2g+XvzkwVG7IFkzQwFKw8kSccEcH5Rd05i
	NZ0pv9ic2LUIQftWieBD3TxIp1tWIQSVvcjf1Pa+E=
X-Received: by 2002:a17:906:1005:20b0:c12:6bcc:a3d6 with SMTP id a640c23a62f3a-c16b4854d66mr29869866b.54.1784272046671;
        Fri, 17 Jul 2026 00:07:26 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm32741066b.14.2026.07.17.00.07.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 00:07:26 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15cd3fd760so855355766b.2
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 00:07:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq0DvoNXK2GxxQj2OZettqgt0tMzVAt/G6jdUeY8AG+g2v7DIP87vj24oDKeU+G8/7etjlRk4Y/fUZ1Qw==@vger.kernel.org
X-Received: by 2002:a17:907:72c6:b0:c16:36ef:d437 with SMTP id
 a640c23a62f3a-c16b477cad2mr54827966b.34.1784272044756; Fri, 17 Jul 2026
 00:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL+2LXtmekL+oc8e48uUXL_2SXvfCc_v7MrHJ6JDh9usRHu0sQ@mail.gmail.com>
 <CANiDSCukMqtarMGb3F0Nf3TfTB7TxHDeWu776StV+0q5q1VSVQ@mail.gmail.com>
 <CAL+2LXvV66O_qvbrHeFyHGjreyart277PgfKVK7jKfJ-MXihbw@mail.gmail.com>
 <CANiDSCttWrSLoftLWPtx7XxYaQ7PRV2+Y0tvir2qaE77PMG1-w@mail.gmail.com> <2026071726-gopher-onshore-61ca@gregkh>
In-Reply-To: <2026071726-gopher-onshore-61ca@gregkh>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 17 Jul 2026 09:07:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCs9T2iDaptLnv4g1ZxNyRQqTzNCD=Ay2uRQoPeSaGv+GQ@mail.gmail.com>
X-Gm-Features: AUfX_mxXQFSgnkHKC3yX-O-fBrQDPXsqK6uhxbq7baRDiPyPihBRrXf4plhXf68
Message-ID: <CANiDSCs9T2iDaptLnv4g1ZxNyRQqTzNCD=Ay2uRQoPeSaGv+GQ@mail.gmail.com>
Subject: Re: uvcvideo: deadlock when async control drops the last PM reference
 from the status-event path
To: Greg KH <greg@kroah.com>
Cc: stable@vger.kernel.org, linux-media@vger.kernel.org, 
	laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org, 
	Jay Chooi <jay@robocurve.org>
Content-Type: text/plain; charset="UTF-8"

Hi Greg

No worries, thanks for the update.

Is there a public page where we can see the status of patches
(queued/rejected) so we do not have to bother you?

Thanks!

On Fri, 17 Jul 2026 at 09:05, Greg KH <greg@kroah.com> wrote:
>
> On Fri, Jul 17, 2026 at 08:54:06AM +0200, Ricardo Ribalda wrote:
> > Dear stable
> >
> > Could you help landing  6d27f92c54ce28cfbd2a8a479a96d6f4a781b7d2 in
> > the stable branches?
>
> It's in the queue, still about 500 patches deep to get through.  That's
> the "joy" of getting bug fixes into -rc1, and not earlier releases, they
> get delayed due to everyone doing the same thing :(
>
> thanks,
>
> greg k-h



-- 
Ricardo Ribalda
