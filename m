Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744890;
	b=H4PO8t7wQAqsvJCQqRF2rdLNiZrDRNFIuFfDyZvS6jnR0GzdMCyvbkI7pKkHImg7hMbY
	 wRJtBP3yXssAquCTOCrwX4CW04GRQBeWreCYq6CSQTOK5l4j+uQlB1BsiSMuZbMkkXiFp
	 3bVW6ThSzxTGEHySvMzyLurz3LFMndsX6O2B9j6YVqVYQNbwxsLSJb+r9nj6rZ1X3ZSZL
	 COWRAhhpT6R3NMGYBKq1IrAbNWWh0DNkRu/sQB1jqMT9j1V7AtycpSiN1DU+DXMVPdhvF
	 n3MgAapdXI0ss/aZp6KNpRlvXSNIuBPGxlMeG1lsoVcmnoBqALoxJM5kYMIbMHmyrAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
	b=BuNlWcWe2nOFs0ioGjreHV/gZzeTYcjqlcU0Wmf0KO2vc7/0NcR3OmlLVv1lw3IK1hte
	 6NkoaWmZWPpaLDA3Sjuofcv9uzCfgVIJlJiqcTldEJuifEbr0L05ZxSOQxlQpZBVV0QRg
	 YzgR6ABRWeWuiniJA1yATq8GrGCJDQlpecPNxlsyIuZbJnbyV1O+rBmg8QXCABgWv+op9
	 yaxPwmVzC2HSa3Wx2crUwc7EizebL8IDVookchrEjquLRzS3ehes7P9qY7dzZDGGJejH0
	 yYwnhrb6KhGquQWdN2yCwcUCIfpXMs8vgtnLR995qzZVUrtzKLm4FPU998FIvCNi9Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eJL4Fmsl;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C12606A31A
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 12:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9C12606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eJL4Fmsl
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so2293375e9.0
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 04:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744888; x=1795349688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
        b=eJL4FmsljjmbthQTxR+1os6ehdA7HrXEazEQbHBtVieR0VPO2U/151cbAENNQpoh6i
         ghPT2cNYVo/lKqchdC0hTr2bHtSoCLidj7k1RSNtzrGC2aEcv0oQykcRlSDYypHCGxWV
         oN9107GYTlhdT2MgiIYtt8UXLvULIASeEkedrMlyX2xy2b8jmEPafnLnSNvUY5lvOeTo
         NXPWb6KvUlNbVtI1IKG8AeHSgzyPBKF3JHGZ8q3aDJQRXenTqEfz5BJ3U/dokIfbdvcf
         Slsbh7fCBGjSc7Gf77SUlg4j2wDW8AntcikkdGFAmrFijCPF0/nFgH21Qncq2ebCqEGD
         f3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744888; x=1795349688;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
        b=cbJ58pCaG6Fbaupfc/fzaN0BBGDCw5P1naYMbix4TiFO3qjiS6H3LZFhAxC+27LIGX
         pTZF2dN6zszp/IvzamOkXlTdlLF+QKrTRgRkgl6rEXHFie0oiczWB8tg4eDFjiTlYG8j
         dyn8YT6QSk9Aqm3GUkmainbG5WKQEGPHBzVE+trQrQf4AYfy72FtGZq+h5bDa7o0NWpc
         JrHReuz09PrGMDwcuSVkri+d51Kwq9CV9qTszcwrYUejo+mPX9Uv3+IkL9bNV03fMW5z
         PKpJSMlBlo9ubMJDsu7lHAeKa6RqJx3LUwTU0twpYBasMGGHuNrjyofCaPUXZZvRjSyc
         8N8g==
X-Forwarded-Encrypted: i=1; AL+hErFmgn+aKrz1BERxubXfOl7hWfydrWfN8mbWEDvu1TYZYKsnDnTwzc4T7CLG6nxc4Asz3ff14Bv/SEZPVw==@vger.kernel.org
X-Gm-Message-State: APuU4Z99W0EAtyK7Q0b8C8QMD3cEYmwNZQWgNln9Hmvp5iA1916xHIrf
	WJeolCQ5fTHj30ESVm1xxeIQlCnEBe3XgVQw5if4GUufwxmD8BSehXMGYB8DjpA6TJ8=
X-Gm-Gg: AYBFou0SeQBcdn96v19urkRJYU3Wr7/qrHuz6HuORsUTW5y1h/pR1rO8HFwXvHotJFb
	qgUScbbM0gTd+WPY3bIKQaAeOqcTqgMzR6Rd5/Yf5Cjkwvb1IljbOiTaRsCFo6ZILVEzEyve++C
	G8HKJiYWEkkWZeiFlvMB8afLjTwdnlXoGQ5oI8YBbH1OaQRME4yjCcJosSfKyPdB6AM2ace21Lo
	oIGO4kJnCTwNS4iU0CM6iHEhYAxMago82TDPszUFxIJx63xKFnmQEbwqCjB6cHnStQ2vuii9Gvn
	M0P4qhr8RHgbNhaKa6IVRkiqdzwdSmc/LBIMC87fgOwVmx0yjveUd7CokdlpiWpElBZXkHFBQCG
	lvE/j3HzBjsz/+waGVsbMcJomEWTWhZ9tA8grQXKJrUD2nKmk6rvON8nx13FeHobl/5Zo0qCBhU
	hSqtStwWL79np/JcEY2dkhU2vHcvymWGPiiU0j5p1aTRQjowblAMQA8QDJRWeW51D4MvW/0Wi6K
	tC/+IOeIuHSH7hW07rVgFjOW85vOb5yehJ+0AOKg9WxDBCKyA/HRbKg4deptXaHH0LwUCCqxerE
	KRMCE1m8wgklir9c20arl4a33azS0Urkmc06vu7rXLwG
X-Received: by 2002:a05:600c:548e:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb5c92cedemr125712795e9.17.1794744888294;
        Sun, 15 Nov 2026 04:14:48 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49dc430fa15sm10124007f8f.13.2026.11.15.04.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:14:47 -0800 (PST)
Message-ID: <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
Date: Sun, 15 Nov 2026 12:14:44 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID
 980
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> +			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
> +				__csid_addr_update(csid, i);
> +				__csid_reg_update(csid, i);
> +			}

Why does this run twice for the same index ?

---
bod
