Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657128;
	b=bj4IkliffRkAIErwDGfU9kcLRxMu+NDKELxnchhIO6t07Si2v3JM49r5pjy3U9FdrBtf
	 rAWqkiqzRQ6BeATEsW+gDymyB5oawq+oigj+HckMWm81Oko9FPmLa+57yRhiJFIF7WQB8
	 cIItxqrG8vGvSnhE8+epKKaVGhzWKrBIEIHitWcvseBKaFzDQ0n1xNgwuSk8kdoFPrzKV
	 ah+T/BF3qHBtz28/fnCXBi2n+JJgZdhc2UUz5gRvaj4qVmsadoIOqQiA+9qxwRHGkcHyb
	 80i9Tk9n0Wt9+1uV7wIi3CU18h9bV1iwuk+3bvb1ARYxb8DFDfxy0YHbNlusc31zGJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=2JasoZs4pU8J575UCokZsfJygggnE4HUTF2MY/ekZJM=;
	b=3uUmf7dFiCmqc5fkQFJ5fUeIEccwQoxJRoYHyUggp5uZrzwpyG4vfcMXlsiVAt0c8syA
	 YGZMv9pBKXdC2ej16Qrda6Ohu1vxGs7Hf0uWIm5beGWeg5i/mOwDai+ckv1ZwYp3FmBjR
	 YHBbydICD1nZEwpKOn8MLzgpsb4+/feIVYHm6pcnD/yNXk/50O7IuHAPRrgJHLq4HHLic
	 4OqQb+wEf+AT289ue3l7BTujoOHsAC1fpEgYXoKAkvV4+HaK1YVDy/PZk0vMBGy2wIbW8
	 hR40eNxGsSJ3sfVSVeZkpqncRdBFlaDpwDQftr150/vusXIG+Nl1gm/FVLe2xX+PTMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O99SkEkG;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07618606D807
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 22:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07618606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O99SkEkG
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a18fc7a38so6476030eec.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 14:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657127; x=1794261927; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2JasoZs4pU8J575UCokZsfJygggnE4HUTF2MY/ekZJM=;
        b=O99SkEkGgX+yDaEspfPEBwygqQ8yh0ngcnnm/iplfx2/07xIvSVgCWc2jc1qSkcnwO
         jwtCw1qWTsbouhE1lPeROQ3bJgD/8puj6J3ZcZehM7KiNfcNo5a15Ea1Tn+iKWQN0xcC
         SVz0yHWR9XOgcrbepl4xvqGN0g4RpL1+2S5tarjVZ127Q6+qaBy9dPX3zPa8fFvAvtMm
         klf9k68dSi0CUQizgOk+OWsodAUtoJTSo47meAdeX/9NRKcji9hdhBcZyU3a7b35XVVY
         DH9AisRVVfLhfy/udG35z2389KxygGWgIF/3F/JYdd2ks6xjup4RnAYhSiRQqnJHS7/G
         9PZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657127; x=1794261927;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JasoZs4pU8J575UCokZsfJygggnE4HUTF2MY/ekZJM=;
        b=I/46qEKHeQi3VT5/z31kXF1YhGJ0On4j5WXZFT8TZfAQEwdImFDJ/wSeO8uQfcxI9g
         eAlHWlpJIOjSQexSeH0IzXqeWIlsYhUh3hG236vYou+gIgls1gC/KrHZwaD/gxv6gTsT
         opODBDoRzxlheXYhssUYFGJec7j60eAdaWSgvEO9tzyNuDtE6DJMOIkRcui7GfeuP3eu
         F/zgfyIpXDCoDz72bb8Xgppc+6PRQe4SDpOtj9WyoAljkqSNAuUP3aAYN1zYTmU4xfj3
         PFh3ZHZ8TfkdUubSlkUrIF32hfEKlgk6k6Fzh5vLG+JnNZGF8MShIiRluaVjtnmvuBc6
         Yb0Q==
X-Forwarded-Encrypted: i=1; AKwUvBy79XEJ2+5MPrhQJ80BJx2OB9ptGZSCrMxBX9rByiYoq5rnYE8HH+TXgULpMHQJ6LERpQgf9NvD4tjlaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9bPnT9f5y1QIkJ4CnaGglGv2SLhP+tUkl6t+u8lPfq/aFo721g
	JyNUulVsY4eBRQ7u/0xhG6n+4riUXCPRmMfhEYfg4uznOVJKLEmENbyh
X-Gm-Gg: AYBFou1QnCYqrt9+8GNhZG92mCtuPwDp3ZjD8Ih3g88mEU+krqFxS3wHIJGiSaqXW1C
	bs4++V0fNEb6fDsOzCryd/nSk4gG1DtzGmMw2b0+DkTwSBGUPJFOgoStmKeGcXpuV2RcwnmuMn1
	VFiB3YMsxvVSXQnqURGxIUuxxGDMdnDlCYOkruxJsSz1oo9sVYVHc66JKbnrByS/CuUv1VC1yYk
	kBbfEFLvTT+JMQM9lXXfdT3HxJiRWc3Zb+felLe7QpRKjoQKDt/FqwfQiXb24pmIRfCd75pH4ZE
	XBCCbxjL+GGFC0XJIZvlxJG3BlZlfEriqaXMMiAQzBNmSPZDwfCEnn3eXMPdE8/eGU9F+821UKP
	SSqH1gZhe4ADVoshsFGgEo0s4w539MUdIz414syjn8w+g9Bs+UHtmWCOpoEsz7W7jszdYQhNmNk
	rMpB080E33cUtxDGmoiLAWfZeQElFRq9RfoFIEUqFbStqA+fGMOXtAdd39kBsSEY5fw7Z4jYn4e
	NF9Ip8ruiaeu+vw9/O95pt/cBb1dm42ItHCNGr23hR68U3VyqPH9ayz3jDo4Ud0S7odNzynSjRG
	BWeKGsdYoZ6eidEmGxbtGDDiLZmUBE52pw1H6S/qXQD2
X-Received: by 2002:a05:693c:6092:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36a423ee70bmr20683512eec.27.1793657127005;
        Mon, 02 Nov 2026 14:05:27 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a429467cdsm38470009eec.19.2026.11.02.14.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:26 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion during power-off
Date: Tue,  3 Nov 2026 07:05:26 +0900
Message-ID: <20261102220526.1755-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com> <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Vishnu,

Without the series, I hit the same deadlock on a Lenovo Y700 Gen 5
(TB323FU, Kaanapali, v7.3-rc). It happened when removing the module
right after a decode session. rmmod waited in __synchronize_irq(),
and the iris IRQ thread in iris_hfi_isr_handler() waited for
core->lock. A loop of decode, rmmod and modprobe reproduced it in
round 4 of 20.

With both patches on v7.3 and out-of-tree Kaanapali support, the same
loop passed 60 of 60 rounds. 2/2 needed context changes only. H.264,
HEVC and VP9 decodes still matched software decoding.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Kaanapali

One question. While core->lock is dropped around disable_irq(), some
callers take core->lock directly rather than through
iris_acquire_core_lock(): iris_hfi_queue_cmd_write(),
iris_set_clocks() and iris_set_interconnects(). These are not held off
by irq_disabling. Also, in iris_core_deinit() the firmware is already
unloaded at that point, while core->state is still IRIS_CORE_INIT. Is
that window meant to be safe?

Thanks,
Joonhoe Kim
