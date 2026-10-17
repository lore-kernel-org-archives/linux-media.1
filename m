Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC66363C40
	for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231952; cv=none; b=DInsJ32SQrboK4HOnecKyUONVKpBTlFRzbdHrYSP3lo4DHhbVNldWDG9S9xWGCx9O25xbT5l3pf2nF505A/jq6xv1dgMTc4KekueIHUsm33FPpOd1dfWEQvY4myC01UJudeCNCVfiYwxVhhKNmaMNQuvhsJq5JgfqgtHOqAvqcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231952; c=relaxed/simple;
	bh=qzvrrLy2qj+cZQoZi4u9ExBicE4rIpxnRBO9CfMg51g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNHzGxKbDqwmL2hQV12EUMWdeRu8Xj/kEfnGfvTE9e44lkOjTP9jo52fqbXwUhhcMFGHOl/G7aAamNhe6pIsxkAxnbnxN3HQR9krgEmDxgGCePnF6mt7rfdATq//v9PHLQPPGL0bCoSHlbqSeSQequVOKOtA7MT/j6p74JBfdts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NC4AEspa; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NC4AEspa"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e0d885929so95769f8f.3
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792231949; x=1792836749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKoUY67/0brH9PfrEtDz8lEuDjVGpCp9GkyhQChz7oI=;
        b=NC4AEspaLZ0jkCIpN6Uk3ZRdt+4i7DlqAmAQ1r0JyKUZlNTH/uOHj8hWMewDJt57s+
         xwrGpxlFXIc5l+wn7Wf8AvsKPKzg/qvKGzAQ4jXGV3FWAT2RxJTdSBtjYTjTcoCBW+FC
         eESeNMxGDzKm7iMAs6FlcbrHNQWJKcAfX8Vu1IGwG9JDgCiBbI576vCnt8RLjp3t2bXu
         xJfvGBrm+VMUozelVlQHpHoQJl0KayFgD3PdozYphwRjGjQd6o4SszLT62/FphvkN4wX
         Z7/I8m2pmvDlrAsjzcbVJl1XH8jcUad7XuappsZG6R6okSZFYyvj9CVfpQnHYtY3HTaj
         XIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792231949; x=1792836749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKoUY67/0brH9PfrEtDz8lEuDjVGpCp9GkyhQChz7oI=;
        b=Q4EUImeA/Ik4Bb65j6wkBBjEVcrj1p2TClfV7fYbxVnA8FXB1HoWKF2J4GwT7Pv2qw
         t7YSDdAVVXEjIWqxaloBk07Hy+2iCXI+KazYXHCJUKxeozcyOpg/5sUzcjIeC0nULcbL
         kWZP3eIIPezFMSNYwA2h5SLv94yNeBslipglT70hg+cehm2/Xw7+SNsFmTgkBSGEmHWD
         i+P1d/1qnF2Z/C57Xk2WEI9ZCs3Q128Y3rB+DcTr519s99L9UczHzTluifX2Qg5Q/NcT
         bb2NIdfBJfbuw+6F+00zRAxwdRItZwXlvCAtulDkhMsmVyrrpwZ9wni5HStokIZzY6xD
         e/UA==
X-Forwarded-Encrypted: i=1; AKwUvBzmQzd8myT/7DGyP7mUVjQaT5eLm72m8YBRuGo0lZSrd+swS8ZsD9UcJAQsiDAQu6wpGkVcLi4FEHHGZw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJUplErwoQchaTy9h+21E3/LQdJfU6MKSrpEPQGoVTSmt+BLU7y
	NpqPYBUNG0x1Bt0k7h/JFFdDLSg+NoSONilu5qSaNumkIXx0/OjrPL4N
X-Gm-Gg: AYBFou1UPxZibU135mlP4W1OFOnWB+zNXwwAja3KEgvbD2kN9yb/6s12kbybVR9+ZwO
	k/KQg58JS6kaSou1C1Z7+v3iZA1F/iZGcbqUX70maFa3MS6rjaw9IyPqR5gSHdklojn4tJV0mIu
	7AvGQRAzyHXtfIij/J2EWyUhhrmDAkeBkfbqZrkZIx+UEUpRs+t+Bj9B5Hopp3L+IKklQqHL/ht
	Z1SM4N5NuSx2LTBtTNz80R3f3ocwI+RqoyJZLSK51SqQkQ+2kB5ffk7v4XnAankKbY0BE7Tr8w0
	XWyY3CQpEf7NDjq3S7SlSxSm+RXTpEQtQdcorJaCYxAUHASuErSiLgNK/oShDK4YKcwO5xu5O8l
	wA1cyvDOR3+XQ2w+J653cxfVx334DJNnvu3Zfj0pLAUrgvFqcWojPmVAAZlnaMuwZhncIaqsj7H
	h4pFWp254ExL5oL3fczMQBsRsOxYmp26ZTYkmKBNttXZITjGyBpQOpIqVttE2W0KYdnqAzAqBmj
	piSzQ4kgU2XcKJG1F9kxBGQGYtQ0RAcSjPomQqua4WGD9NUcbmbMTxY0PjO6vb2dPURbPhb
X-Received: by 2002:a05:6000:14b:b0:488:8525:4979 with SMTP id ffacd0b85a97d-48e07fb5261mr2934328f8f.45.1792231949280;
        Sat, 17 Oct 2026 03:12:29 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5957sm10183948f8f.9.2026.10.17.03.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:12:28 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gjorgji.rosikopulos@oss.qualcomm.com,
	jigarkumar.zala@oss.qualcomm.com,
	hariram.purushothaman@oss.qualcomm.com,
	akapatra@quicinc.com,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	daniel@quora.org,
	konrad.dybcio@oss.qualcomm.com,
	christopher.obbard@linaro.org,
	alex.vinarskis@gmail.com
Subject: Re: [PATCH 2/2] media: qcom: camss: account for C-PHY when calculating link frequency
Date: Sat, 17 Oct 2026 11:12:27 +0100
Message-ID: <20261017101227.61271-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017035221.3816464-3-anusha.nandi@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com> <20261017035221.3816464-3-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Anusha,

I tested the CAMSS pieces on X1E80100 and found one extra receiver path
that needs the C-PHY select.

X1E80100 uses csid_ops_680, not the gen3 CSID path changed here. The
C-PHY flag reaches struct csid_phy_config correctly, but
camss-csid-680.c leaves CSI2_RX_CFG0.PHY_TYPE_SEL clear, so the front
IMX681 stream is decoded as D-PHY and capture times out with a zero-byte
buffer.

The equivalent change for CSID 680 is just:

    val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

before writing CSID_CSI2_RX_CFG0. With that line, the register reads
back 0x01300000 on CSID1 and 3844x2640 RAW10 capture succeeds from the
IMX681 over one C-PHY trio. The rear OV13858 still captures over four
D-PHY lanes.

I also ran a control with your posted CAMSS/qcom-mipi-csi2 module code,
plus only the X1E PHY table and this CSID-680 select: both front and rear
capture successfully.

Would you prefer to fold the CSID-680 line into this patch? I have a
clean follow-up commit ready if you would rather I send it separately.

Thanks,
George
