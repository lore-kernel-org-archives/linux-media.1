Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEF8394782
	for <linux-media@vger.kernel.org>; Tue,  3 Mar 2026 10:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532506; cv=none; b=up4Lsw1SeZXiUl22K4hsuv5OwTU53BMHxomSQWFTokW1MuMFG1peAI8GAmgSA8SOnmVObmGj11dV4TcAOmWl2h01XHQlZCaIvDIw7yJS80CPOjuTJnBA+BC2joD/ilFCOTSaQIccG8FyuN8XdYTCLiO5ASXlVs5DdkeYJfglAHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532506; c=relaxed/simple;
	bh=h+2GcRJgSIlqWkyAemob1F5MDWMzyrig/NBRlRV2B5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8NxgBkdm9S3YOPN0yDLS2OtAvQzbWUGQBkeP3wepjcbM7V1nT02/IUTsLUbBHyiFQDrZavBcmHbKA95Jjcqcqh0yG8jLNLUB14/eGNAxWN1aTI5twChSrJHkOyInmwAtSU1OEE+EmOKa+rPtY553xmqqmex8zAoTorPbw32WlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHf2qfDA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHf2qfDA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48069a48629so59257165e9.0
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2026 02:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772532503; x=1773137303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MyO8nnua/YSeSGPvcxsWXY2ujou9FaamDCdW2t1bD3o=;
        b=DHf2qfDANg36y9Rwv3qwwWio2pnPckeigVi8u6BZQKPwn8J8qJ5bjfTKr6Xv2RLOtx
         CdRz4E6vmfS6asTI8Eto2wSJuRwvR3ywe5SDxsJsf3eGikyRGb7l6Pe8eezu8UAY6pBO
         ZLxEZnQY35HeJnY2Plb5oUnMnKsDCY0vzABgBTxiJ7BZuTJFw3pFdlYfoLjfltXhOl8M
         7B0uw0ucufdTD3qw6qDgEvOP93dLVmCymPlSmsbabvLXSfLAKp+86hPdIa1T00DajGgm
         fxK+hU6u45AQsUS/LPE+6fGDJZNpcfjLK2kCdUmol4CJwuZWNsWZA/yuM4PvUhrZf3CC
         gSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532503; x=1773137303;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MyO8nnua/YSeSGPvcxsWXY2ujou9FaamDCdW2t1bD3o=;
        b=ChxP8OKaGb8LvwWv4elLkLDR9nO1l9Mn0LcgWJ2XQnqTeTxCxeVW7cCpka/sIHNNEy
         PNEUutbhPpT+20K3g5Z419iwjtTro+a49PF6ag7oC1ykvkjKqrMnuqXknuqwgzO6ddGQ
         BfoSwo/kXbeP3Kx4U55/tlgUY8WcWvgi/OZ3giMilWBnBoaCecaVVf/4TOWhuU8bklyU
         fx3VAJ3Fo8SCgR4SzcrHxte+1r/2gQ0/qPnZiatwrNR8t5i4NeLAx/u8sl3gwXj5p20S
         X7IDqb9WRh6oFrlFJMoEiwYdNSSraz1QE9uqQ3m4NghKzuNo3eqD9XlHR1WsERcCnx6J
         sOvw==
X-Forwarded-Encrypted: i=1; AJvYcCUn50mC4sx+Xe6U2xWoc2I03dnShOOrHxLGfUHjpatrlRVocEk7+4HB1DsG47q00gngkc39Dk76ANw0Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCeimlP0WQphukTovdSk33c6A/iJkHPVYlQuIjFW0QSwsLdRA1
	gA1/1ULVemAzzjpGJhcukK0AW/L5KjHcz0D6AX6f3AJ/sH+VP/f7zIRUBlnlY/rrLDQ=
X-Gm-Gg: ATEYQzyQUTNxM6vx4rR7wG5/LmFL67KTPxFz3LZ8JkUPDbVA63xnLvZ4HXox/3WLDEO
	4qW0EZQcxV/7fCx4/uaBL9Mtn7I/4t62IJ4rQBKQgevrA6BVYjqyEwyhNDQ+BxCnT66hnj7VDPK
	gsgJqT2jR8DaRU5co+9rHq0+9Uxkn7+wcNMKBiV+gJNWYHrXNKrjO0gD9ldepeCuaFr5KM0urxL
	m9UgOe9+L34/d9FjbZ7PJ3gspj0TiHiB2x8t7KmZKfxsNhcfKiMnEkPaSkcYMfnds8HdHxz9fyL
	N6/Vqrraqepyji3+XaOru83AcEcA58SUYnmtc0O8Pd2H6hi2n0bfLw/zvQP+n/LIOWM+Uvv+C5w
	ydqKRqAJ7saevA89vccAZT+bmb6DEmcv0yd78STFpGpjOvVxNhZOq/s8JIHxv1EM+H6RwyqZy/j
	DDn7CZTlvQWuJBxZ9K7mwqJyihSBpwZyLz6pFQ6GzXxwjzALHt3ixgEskzgd/tNTIt
X-Received: by 2002:a05:600c:1989:b0:483:71f9:37f3 with SMTP id 5b1f17b1804b1-483c9bb663amr273676705e9.1.1772532503534;
        Tue, 03 Mar 2026 02:08:23 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48512628e2asm31393555e9.1.2026.03.03.02.08.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:08:23 -0800 (PST)
Message-ID: <be4abbc8-414a-429d-baff-48c829378a31@linaro.org>
Date: Tue, 3 Mar 2026 10:08:21 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2026 10:00, David Heidelberg wrote:
> We don't have any documentation how these lanes are set. I think it's 
> good to see two working variants, someone may need it to demystify it 
> one day and the history may comes handy. Also both variants works for us.

OK sure that adds up keep it progressive so.

---
bod
