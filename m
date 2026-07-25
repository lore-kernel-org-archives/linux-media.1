Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C0026738B
	for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 12:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784983634; cv=pass; b=Sy0ld5S7BI8KVrY/HAAHxsPyb1y0m6Tp6Sj4vMv1qc34Wlnhf1y+gPweQY5G3XynO8ErIgnOO2v/Hzg8r72YzLDKDTnk94iReabmcTZQ7/fuCsEyVYGm2IbQFHjSw7JIvypQH+ThBJbjrkhSRXHiD9SfSaxOD3fnpDKvwhZJ1QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784983634; c=relaxed/simple;
	bh=nbfEHiFg3ujAMDl8T5Sowr96/ZasmMbVmzrGHikYY2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+6kLtOk8oAW+bqbrAghTcv4X3hsGW3Ir93DidnDE81SX/e+UYvfCH4saRfz9VSuTbr2H9QUEktPcerbzsVmBsCbU4M09PNFkC2+Q5J/oiNTMHtbQRaMOGsejQXmlomHZ3yfVuTojTH8PJONpcCPOaR3K5CmtVbNUNhgzBCWxG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=hzTnJ1kZ; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="hzTnJ1kZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cacf197759so19023715ad.2
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 05:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784983632; cv=none;
        d=google.com; s=arc-20260327;
        b=LzRi5gPs0s+QLk2ORifvW4FVAogNRUm+eSnNS6s6RHKvnD5tbQW1T1QaBrcuCoiDYI
         PIhK97iTq38poPNyW0mAm+RqSDvsqsKFryvXAZMUwCPf77N4bCW3hmtkRmDTGTADFQ9a
         TM8aCwYIu/2B2MUn4z/KFA5YqU69G/pgQIlzGhd1L++P5h3whAOuWvy/zhVLRayz2FfX
         4PHe+WQ1sEVFq8OfRV4LqQ2RFbinveUOv5zX/5ATXtKu8kfjmWTGTPSsV7/fIw4UtUYd
         ACnjhLY2YxUyDexlJqR8pBuekLJNLCISX+Xcc99JQb7P/58HgvWiJR/ojZgG0UqCxFtG
         v5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        fh=N9Aucmr3tWOletxa+XSOTnCAIErDWu+WAKxe00zQbKw=;
        b=GutzenAjTCWXlgDfTgAWePSSB/faoZ7UexfGrF5i7BcwOXNwXykffYJIdzugwrpJjH
         ukT+sycFqrG55O9BM4aSW7u9OipEYWHolL1JiJui7nNJfGAfSmvwcDf8ZA46F3obN2Ki
         V5VjKo8jXyZW85umcWxuKqhMav1c1hoI7ZiaYVGRtkaaRDqVADTvAX6UaXHhBKUOgQw/
         hyRmUscEukxfEfZ8qnu8Ju+R1nUygr/JWftMcYauWQES9IKgZ+8Sx9OoNGymUB7KpiFZ
         VIFFC1fADdyLOjs5M3hjOODDn+Lriwg+S/re85N6EOwXnSh2bJB5KTUdlqLjlG7gjP4J
         qKfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1784983632; x=1785588432; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        b=hzTnJ1kZ8VTPX2spDgxKSesmfIj1g9m2IqHc8k+xpgUndOW6+Jz0Knq6axDOrDSES0
         QyWZtsKv1WXuOS5NsC/qsqVOud+XECSiynAMq8yDBGnwOG364hXikPmLhcIVxbMuU+b9
         cksvPr90Bwm2pExw1Xbz2yowaCUyCF/tOS80s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784983632; x=1785588432;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NFb3xFmMVZz4nbO4NmTzoVtr612rRjtqaPgKgbVu0P4=;
        b=a/ox0d7/j/QzSJ6UXXXZANgtkeuqnkmaaNGBi1V3MJD5SPGp88PB7bZdCALiicMRQ1
         rJLhXy79HzS+ENYFD6LT2YEZV+GbeAaWcYfdCxKM47svmgqlDld6FnzgnjPdt+H3mFaA
         q5Uh1uqYIqDRJk4odZ4ul43i5ozF+FtXkKPT35w+PobrpzscfTyW5USmBP6zuq20+/Cb
         sl0ZCGkrMocGwukLOGABo0X7zKW5wrATXxsZ8GH4H9xvUNd8i27jLcgUm05FZZ1+PNDq
         1ChS3RW3ZpTdmipszMxnAofq7J5SDtanZgnQPHSqd7TDgR0K/YlljAsOg9kSCC154+ww
         ErIw==
X-Forwarded-Encrypted: i=1; AHgh+RojMWKgJXmEQISxOk8e7QY+8ircxbSqRjb/lqnwIrPBg2FVnctAdS+dLx0GMdN52VnZFDyXD3+oyc8wWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrddfwjx30keMAcY53AKRrqBmzLU5By7nVWfGusxSOutmZNLX+
	YoszGP6ZNr6kUHFMiIdKDiLtBt7K/yi918P5irLvVolL1ey9TwD7nsNalyoXM0kw8CwK0IiaiEg
	xFJHY4BjA71RDbRFmL4mV94lMewcEHKwSBr8NyURRDg==
X-Gm-Gg: AR+sD12udzPtee5gICC6e3emdtsvIDHWYK0eLP23mfL0qXmcWMy212lWEAtsoyNNG5Q
	Sl2RPw/+f2n2vXoGIMSllKL8Zw7Zmlsx+FImOgur05HQf5eBBKK8ik+wp+SQmk9PUE8DcF2ttWz
	JpWEHG/wHr57QXmq296Qe+DbDKYwwX797yt3wVdQ8mar5njQWe87HZTYDJxMpxSH+hPIJNndG9d
	H6YwsZMF5DGf2P852optTlEVU/WP6W6GkMgHQLvkKbc1pnu+t71HxyoqrW23JMtcljCGF7m4vTw
	7NCWAnGJSRpU/ivZhzCqmb3CtVYmpYljDiSg94fI33IKdBa3SlERikuWonO9yRI7+GnGuuDEOhd
	94Xz5U7MMvudLGtfawGSZGlPVXll0CkLViQtjGkel1mJ7aWKLEaJZst1R9VX73gKKdvH8EXCwna
	J4Bq4VjqMFTSnWiyqNl0JFIZzixXVZEDm3Rh5RViDTof3uKX8svyWW5DGpwc/3wC9CeUPsCA==
X-Received: by 2002:a17:903:26cf:b0:2c9:97a9:2098 with SMTP id
 d9443c01a7336-2cfde895b4bmr22242195ad.44.1784983632412; Sat, 25 Jul 2026
 05:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sat, 25 Jul 2026 20:47:00 +0800
X-Gm-Features: AUfX_mwTJNR7-hRaq1ZTUYAiX7Ud5gZGyBy8PdA42w9wDa17cNUs0zXUmHoUAFI
Message-ID: <CAMVG2stKmNxe-mdqbqO4MDLDrJCiNXw9kt8SA8egYAmByf9fKw@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Add dt-bindings and PHY updates for CAMSS on
 x1e80100 silicon
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 08:06, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
> Changes in v12:
> - Updates camss sensor find method to find the sensor in the CSIPHY port. -
>   Neil, Vlad, Bryan
> - Drops dependency on passing polarities and positions. Moved into CSIPHY
>   port as agreed. Neil, Vlad, Bryan
> - Omitted mux to CSID as discussed this will be done when splitting CSID
>   out as its own individual node. Neil, Bryan
> - Updated Reviewed-by: - Loic
> - Link to v11: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
[...]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Works for me on 7.2.0-rc4 with 'qcam'.

Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100

Thanks and fine work!
  Dan
-- 
Daniel J Blueman
