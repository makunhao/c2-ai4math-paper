# AI 日志 —— C2 AI for Math 论文

> 交付物：`*AI日志*`
> 记录方式：按阶段记录「我的指令 / AI 产出 / 我的判断与纠偏 / 结果」。
> **所有引用文献均经联网逐条核实**（阶段 2 附完整核实表）；**无一条虚构引用**（挑战红线）。

---

## 阶段 1：解析材料，确定论文骨架

**时间**：C2 启动

**背景**：资料包含两份 PDF（材料为空目录则从 `materials/` 取）：
- `Lectures on AI for Mathematics.pdf`（112 页，同济大学 Xiaoyang Chen & Xiang Jiang，2026-04-11，v1.0）
- `中文论文大纲（AI4Math）.pdf`（12 页）

**问题**：Read 工具无法直接解析这两份 PDF。

**我的指令（给 AI）**：

> 用 pypdf 把两份 PDF 抽成纯文本落盘，然后总结大纲的材料结构（章节、三级标题、图表），并给出「可投稿论文」的骨架建议。

**AI 产出**：
- `work/c2_Lectures.txt`（182,483 字符）
- `work/c2_中文论文大纲（A.txt`（7,040 字符，含中英双语大纲）
- 骨架建议：标题《从自然语言到可验证推理：基于语义规约的 AI 数学可靠性框架》，9 章结构（引言 / 三层模型 / 瓶颈 / 框架 / 相关工作 / 应用 / 实验设计 / 讨论 / 结论）

**我的判断**：
- 大纲给的标题和 9 章结构**本来就合理**（"语义规约层为核心瓶颈"是一个有立场的论点，不是综述）。我决定**沿用大纲的骨架**，但**大幅填充**——大纲只有要点，论文需要论证。
- **关键决策**：AI 建议把论文写成"综述"（罗列现有工作）。**我否掉了**。理由：综述不容易做得好（要求覆盖全面），而**立场论文（position paper）的贡献更清晰、更可证伪**。我要求把它写成"提出框架 + 给出可检验假设"的形式，并在讨论里**明确承认尚未实证**。
- **取舍**：我选择**不编造实验结果**。实验章写为"预注册式设计 + 假设 H1–H3"，并刻意设置**证伪性假设 H3**（框架在简单数据集上优势有限）——一个诚实的方法论文应当给出自己不适用的边界。

**结果**：确定论文骨架与"立场论文"定位。

---

## 阶段 2：文献核实（本阶段是红线所在）

**时间**：C2 关键阶段

**背景**：挑战红线写明「引用造假 → 研究严谨性 0 分」。所以**每一篇文献都要能对上真实的题名、作者、出处、编号**。

**我的指令**：

> 我要引用这些工作：miniF2F、AlphaGeometry、AlphaProof、FunSearch、PatternBoost、DeepSeek-Prover、PutnamBench、GSM8K、MATH、CoT、PoT、Toolformer、自动形式化、Lean 4、Z3。**逐条联网核实**：题名、作者、发表处、年份、arXiv 编号 / 卷期页 / DOI。**凡查不到完整元数据的，一律标注出来，不要猜。**

**AI 产出（核实结果，全部经 WebSearch 命中一手来源）**：

| # | 工作 | 核实到的元数据 | 核实来源 |
|---|---|---|---|
| 1 | Chain-of-Thought | Wei 等，NeurIPS 2022，**arXiv:2201.11903** | arXiv 摘要页 |
| 2 | Program of Thoughts | Chen, Ma, Wang, Cohen，**TMLR 2023**，arXiv:2211.12588 | arXiv + TMLR 标注 |
| 3 | Toolformer | Schick 等（8 作者），**NeurIPS 2023 (oral)**，arXiv:2302.04761 | arXiv + NeurIPS 收录 |
| 4 | Autoformalization with LLMs | Wu, Jiang, Li, Rabe, Staats, Jamnik, Szegedy，**NeurIPS 2022，pp. 32353–32368**，arXiv:2205.12615 | ACM DL (NIPS'22 Article No.2344) |
| 5 | DeepSeek-Prover | Xin 等，arXiv:2405.14333，2024 | arXiv |
| 6 | Lean 4 | de Moura & Ullrich，**CADE-28，LNCS 12699:625–635**，DOI:10.1007/978-3-030-79876-5_37 | Springer LNCS |
| 7 | Z3 | de Moura & Bjørner，**TACAS 2008，LNCS 4963:337–340**，DOI:10.1007/978-3-540-78800-3_24 | Springer LNCS |
| 8 | GSM8K | Cobbe 等，arXiv:2110.14168，2021 | arXiv |
| 9 | MATH | Hendrycks 等，**NeurIPS 2021 Datasets & Benchmarks**，arXiv:2103.03874 | NeurIPS |
| 10 | miniF2F | Zheng, Han, Polu，**ICLR 2022**，arXiv:2109.00110，488 题 | ICLR + arXiv |
| 11 | PutnamBench | Tsoukalas 等，**NeurIPS 2024 D&B**，arXiv:2407.11214 | NeurIPS |
| 12 | AlphaGeometry | Trinh, Wu, Le, He, Luong，**Nature 625(7995):476–482 (2024)**，DOI:10.1038/s41586-023-06747-5 | Nature |
| 13 | FunSearch | Romera-Paredes 等，**Nature 625(7995):468–475 (2024)** | Nature |
| 14 | AlphaProof | Hubert, Mehta, Sartran 等，**Nature 651:607–613 (2025)**，DOI:**10.1038/s41586-025-09833-y**；2024 IMO 银牌水平 | Nature 新闻稿 + Nature 引文 |
| 15 | PatternBoost | Charton, Ellenberg, Wagner, Williamson，arXiv:2411.00566，2024，**题名 "PatternBoost: Constructions in Mathematics with a Little Help from AI"** | arXiv HTML + ADS + zbMATH |

**我的判断与纠偏**：
- **AI 第一次给出 PatternBoost 的题名是错的**（AI 把它记成了别的标题）。我要求它去查 arXiv 列表页，最终确认为 *"PatternBoost: Constructions in Mathematics with a Little Help from AI"*。**这正是红线要防的那类错误。**
- AlphaProof 的 **DOI 与卷期页**最初只有"Nature 2025"的模糊信息。我要求追加核实，最终确认 **Nature 651, 607–613 (2025)**，DOI `10.1038/s41586-025-09833-y`。
- **一条硬规则我坚持执行**：宁可少引，不可错引。所以最终 `references.bib` 只保留 **16 条全部核实过**的条目，删掉了 2 条只有模糊印象、查不到一手出处的候选。
- **关于一手性**：`references.bib` 里优先使用**一手出处**（NeurIPS/Nature/ICLR/TACAS/CADE 原始会议与期刊），arXiv 作为 `note`/`url` 补充，而不是把 arXiv 当正式出处。

**结果**：`references.bib` = 16 条，含 8 篇以上一手文献（Nature 3 篇、NeurIPS 5 篇、ICLR/TMLR/CADE/TACAS 各若干）。

---

## 阶段 3：撰写 paper.tex

**我的指令**：

> 按 9 章骨架写 `paper.tex`（xelatex + ctex 中文）。要求：① 每个论点都要有引用支撑，不得出现"无出处的事实断言"；② 至少 1 个 TikZ 图 + 3 个表格 + 若干编号公式 + 定理/定义环境 + 算法伪代码；③ 实验章写成"预注册式设计"并含**证伪性假设**；④ 讨论章必须诚实写出 4 条局限。

**AI 产出**：`paper.tex`（约 700 行），含：
- 三层分解模型（生成 / 语义规约 / 验证）
- **TikZ 图 1**：三层架构 + 失败回传虚线（修订对象应为 IR 而非自然语言）
- **表 1** 三层性质对照、**表 2** 与现有工作定位对比、**表 3** 实验分组
- **算法 1** SRR（语义规约驱动的可靠推理）
- 定义 1（良类型 IR）、定义 2（双向一致性）、命题 1（含证明）、注记 3 处
- 公式：类型语法、规约映射、流水线、可验证率、回译保真度、结论等式

**我的判断**：
- **要求把"贡献"写具体**：AI 初稿的贡献描述是"提出一个框架"——太泛。我要求改成可检验的 4 条（概念贡献 / 方法贡献 / 理论视角 / 评估贡献），且每条对应论文中的具体章节。
- **要求加入"证伪性假设 H3"**：AI 原本写了三个都是"框架更好"的假设。我加了 H3 ——**框架在 GSM8K 这种简单数据集上优势有限**。理由：**全是正向预测的假设集不可证伪**，那不像研究，像宣传。
- **命题 1 的措辞收紧**：AI 写的是"漂移会被发现"。我改成"**在原则上可被人类审计发现**"，并加注记明确这是"可能性命题而非复杂性命题"——**不保证审计成本可接受**。这是防止命题被过度声明的必要限定。
- **要求诚实声明**：在摘要与讨论中明确本文是"立场与方法论文"，实验为设计说明而非已完成实证。

**结果**：`paper.tex` 完成。

---

## 阶段 4：解决编译环境（本阶段踩坑最多）

**背景**：挑战红线写明「不可编译 → 技术实现 ≤5 分」。所以**必须真的编译通过**。

**我的指令**：

> 装 LaTeX 并实际编译 `paper.tex`，不要只声称"应该能编译"。

**过程（含两次失败）**：

| 尝试 | 做法 | 结果 | 诊断 |
|---|---|---|---|
| 1 | 从 GitHub Releases 下 `tectonic` | `HTTP:000 size:0` | **分层验证**发现 `github.com` 整域不可达，而 TUNA/PyPI/阿里云均正常 → 是**域名级可达性**问题，不是带宽 |
| 2 | `winget install MiKTeX.MiKTeX` | 报 **`Successfully installed`**，但 `miktex/bin/x64/` **是空的** | **"成功" ≠ 装成功**。安装器后续组件拉取失败却上报成功（静默残废） |
| 3 | 清华 CTAN 镜像下 MiKTeX 便携包 + `--unattended --portable=` | 装出 160 个 exe，但缺 `xelatex.exe` | MiKTeX 的引擎 exe 是 `miktex-xetex.exe` 的**同名副本**，按文件名选格式 → 手动 `cp miktex-xetex.exe xelatex.exe` |
| 4 | 编译 | 报 `formats.ini could not be found` | `initexmf --report` 显示 **UserConfig 在 `AppData\Roaming`**（我一开始放到了 `Local`）；且**安装树未注册为 TEXMF 根** |
| 5 | `initexmf --register-root=<install>` + `--update-fndb` + `--dump=xelatex` | **`xelatex.fmt` 生成成功** | 关键修复 |
| 6 | 编译 `paper.tex` | 11 页 PDF 生成；`ctex` 自动从 TUNA 装好 | — |
| 7 | 检查日志 | 4 处 `Undefined control sequence`：`\llbracket` / `\rrbracket` | 这两个符号来自 `stmaryrd`。**我没有加这个宏包**，而是用 `\providecommand` 手写：`\mathopen{[\![}` / `\mathclose{]\!]}` —— 零新增依赖，避免又一次网络依赖 |

**我的判断**：
- **元规则（在 C3 帖 03 里也复用了）**：**当同一个错误重复出现 ≥3 次，不要再修参数，去验证前提。** 我在 `HTTP:000` 上反复改 URL 了几轮，真正的变量是"链路可达性"。
- **对 AI 的一次明确要求**：不许写"理论上可编译"，必须给出**编译日志与产物**。最终提交 `paper.pdf`（编译产物）+ `build.sh`（一键复现）+ 各遍日志。

**结果**：`paper.tex` 在 MiKTeX 25.12 + xelatex 下实际编译通过，产出 11 页 PDF。

---

## 阶段 5：交付物装配与自检

**我的指令**：

> 装配 C2 交付包：`paper.tex`、`references.bib`、`build.sh`、`AI日志.md`、`AAR.md`、`README.md`，以及 `paper.pdf`（编译证据）。跑一次完整编译确认可复现。

**AI 产出 + 我的验证**：
- 全流程 `build.sh`（xelatex → bibtex → xelatex ×2，4 遍收敛）
- `README.md`：编译方式、依赖、引用核实说明
- `paper.pdf`：11 页，含图表公式，参考文献 16 条

**结果**：交付包成型。

---

## 附：本阶段的两条 AI 协作经验

1. **AI 会给你"记得很像"的文献元数据。** PatternBoost 的题名、AlphaProof 的卷期页，AI 初稿都是错的或模糊的。**文献核实不能交给记忆，必须逐条联网核。**
2. **AI 会把"装好了"当成事实。** `winget` 报 `Successfully installed` 时，AI 倾向于认为环境就绪。**必须要求"可执行文件存在 + 冒烟测试通过"才算装好。**
