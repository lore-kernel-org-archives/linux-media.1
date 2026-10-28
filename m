Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201770;
	b=zsTT1XL/TJItAj2KgCaA1KHSfEqZv5GgKNu3SGDe8hucmlJbgX7X6PlX/WwAhK9uD2Vj
	 BPalE46PRM3wEc48pK11FlGYNQSIyw0wogOsEVQd6EOBpfuzRF56Y9tHiFHD6GVjs0wWL
	 c1td/flYJsdCf5n6p7Fu/JpwT84lvImFgkyYpC3jMpaGSqdhGEjILdFefr+cubOiiRXk7
	 O8x0xwsvgVabyQ8+Y5rAJ6s5BSIOKz95BWdPsU1bOh/xmw+756OLv57oxSrvkCWp/BENG
	 birH0qyBA3v76pP0/IMreDcl9Ealf0w4g/kI3dn1CDk3JFPCfg5WetXQUM0AwS9VExA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
	b=uOq9fWtu+MQA5OMW7aJexulyOUVO4vXvKoGOh8NvB75wJhYQUMreefvuH6NDeaDPvIPh
	 HMfmAOcdHvNcQz1P6QL5pOwLi5wqklPRN/XAksrXFnrdDv0fu7mfXHoRn8Yw9caNF61NB
	 sCdB+fuOvVaX/nN81ai8D/FzxBXBS8eCZMXXmgKoQd43TEb5HKudQ3Cr4UGc6MdnroZjI
	 hFAFb/l42kR5fn6gRKjG15UyZDjHJXUyUy/8IQfBMO+zwp8KTMe+BB/mwxsrRNlq81Cmj
	 m581USUwNZx15DT9Q+aTxrIWfUdnW1ykLg6fptL4cZ61PpB3ItjIF4YF7mOOyqmzJBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UZ5vxgZU;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3F5606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC3F5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UZ5vxgZU
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so10842485e9.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201768; x=1793806568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
        b=UZ5vxgZUunglt4G10pOQzIVVK9fHKqQKfOoFuVBy7okRyLDlBjGEnBOAeVPvW/aOMu
         1wadd36u1eZDO9mNluALYMFMr2+yMlApFveU9bZa2AhqrkIBMH/ZGT2XzMH6Ip8dReJJ
         aaKalseqlpgjcq1GqbUOS7FDjwY75yP2MlyOmAtKaBRs9Z9m+SAd4S/uYNDPG25kNINs
         F2Xa+qviSLXUBhO+NSoVvdoqYgTbouK6lRfZEf9zuBTvBNF0FDMNl3Epf/CG6nwqcmeA
         V3hZ7yHlmaIiiI71wRfyx3A5JlWFE1+dM8uK/o1xLtkwEzrLDHmo+8/AzAaLuXjZJ6K2
         8mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201768; x=1793806568;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
        b=fI9ryrWowPfIjVoW0ya0h86YLKrn5/Il3/3HpfbUXprwPi3lTIbTU5a+DnScnEEtIl
         ZTPrseJQ6nmFAw7fQAlxodb8lrt8uWikKZHEVBLGDrPqAuh+BkavaFtOVRmSc27oFSBf
         nAWJadwJt/nyocPiZAmRffPtg/hg4ZOiZEWLGZ6UE0UqYz7WTN/3iTONIkaaEaShvF5u
         FbpusaDvtNI/1JxPaOkDyVnHw+M4/XR82xV9Mp+XySeW8FzdpOdjT/ZURs6/XOmXJuvI
         E/jAz+xy7MpmA75nXCRr16bTrgCtKAuaTviu3fyZ2vyNORFDhsouk3XeLLXOwDqZYFVx
         FQRw==
X-Forwarded-Encrypted: i=1; AKwUvBz4Nm9EQGAIS1lwp9I4GTfWZD6og6c5ZhKyzTJLSxOlcVO3I3RePXlitRwsXyxu7R3fyj44N+AZQqz7AQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLHijQiO30CHQ6hmeG45wdsgksDwiccSGv/S/aW/8k0ax0EVwhB
	SdNAPwMv/4FFTg6OPE7226fIG5T+Iqyq7RTsQRD/ZMC+5Oc3EIdUD9Vy49wNvGrjkws=
X-Gm-Gg: AYBFou1MeoK2rJS5aTwALNXWUHsSZ/Puiy7itUL+/6UTkPv3S8dWYqkw4VzYYQ1rRYW
	eI3lp2SZbkBDpfbfW0aWyaUlw+s8z8nZjjNZdlAsun8i6u5NLUy2LK53H+JWAF30pxAhtg7JCRW
	+6WEoyxW72LrhyeQY/FXaboJzectLxN/oCPWaZQN4Z2XhQlmteGV4wTsztbxEkxVt9ivVR3JeYC
	awzSyCIFh15zXBw7QjXrqNZv56SsDTiRZ3hLZGEXCyXMdsOyG4nzEojSf90SHH6/CaxWJb9Wqet
	nDJzxXmaKu6SQdk5bsf6OWBJWpD5/WaG5I5V0DH+97UEK1tD5eP/XQGf5/n5AFLe00efusFBP49
	ptRu7Kfh50jTu8ptiiiljinEQ4f44Xy85a4jrQJiGa2gOj+l87a3gEoaAUJZzWU/X3iqgap9MWT
	m42lC940J9TNJazRogyETYt1XUT2i4CnvaeaySbL6fxhJASvV765MY3d+885Z46BBKMc197Q08V
	q0J7TOO3/U/vM3MRzNWP4ZgUZQPC6/UbTiNFbeJEOPvF6MOvWuZi2ZVK8/1G01/bU43a35yxUxD
	kDS/1BR8ldn3ZOliNlLmCuHAy0ogYD2dIliZ7KMWGA==
X-Received: by 2002:a05:600c:154d:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4a96720266bmr62849985e9.12.1793201768098;
        Wed, 28 Oct 2026 08:36:08 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm41594465e9.4.2026.10.28.08.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:36:07 -0700 (PDT)
Message-ID: <ba560f04-d817-4b01-a1c4-293165625f07@linaro.org>
Date: Wed, 28 Oct 2026 15:36:05 +0000
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
Subject: Re: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
> Add support for the TPG found on Kaanapali. This TPG uses hardware
> version 2.4.0, which drives test-enable and reset through the
> TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
> TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
> CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
> the data source when a test pattern is selected.
> 
> Add the TPG resources to the Kaanapali camss resources so that the TPG
> subdevices are created on this SoC.
> 
> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
